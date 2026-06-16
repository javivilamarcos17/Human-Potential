// Simulador E2E: ejecuta la lógica REAL de app-funcional.html como si un paciente
// la usara 10 días seguidos. Uso: node tests/sim-paciente.js
const fs=require('fs');
const html=fs.readFileSync(__dirname+'/../mockups/prototipo/app-funcional.html','utf8');
let js=html.match(/<script>([\s\S]*)<\/script>/)[1]
  .replace(/if\('serviceWorker'[\s\S]*?\;/,'')
  .replace(/if\(!S\.perfil\) ir\('alta'\);/,'');

// ── stubs de navegador ──────────────────────────────────────────────
const store={};
const fakeEl=()=>({textContent:'',innerHTML:'',value:'',max:60,checked:false,disabled:false,
  style:{},classList:{add(){},remove(){},toggle(){},contains:()=>false},dataset:{},
  querySelectorAll:()=>[],parentNode:{querySelectorAll:()=>[]},firstChild:{textContent:'Kael'}});
const els={};
global.document={getElementById:id=>els[id]||(els[id]=fakeEl()),
  querySelectorAll:()=>[],createElement:()=>fakeEl()};
global.localStorage={getItem:k=>store[k]||null,setItem:(k,v)=>store[k]=v,removeItem:k=>delete store[k]};
global.navigator={};global.window={};global.location={search:'?debug=1',reload(){},href:''};global.crypto={randomUUID:()=>'test-uuid'};
global.Image=function(){return{set src(v){if(this.onerror)this.onerror();},onload:null,onerror:null};};
global.setInterval=()=>0;global.clearInterval=()=>{};global.setTimeout=()=>0;
global.alert=m=>LOG.push('ALERT: '+String(m).slice(0,90));
global.confirm=()=>true;global.fetch=()=>Promise.resolve({ok:true});
const LOG=[];

// ── cargar la app ───────────────────────────────────────────────────
const ctx={};
new Function(js+'\n;Object.assign(this,{S,save,altaSubmit,cerrarTriaje,terminarJornada,diaSiguiente,faseDesde,etapaDe,nivelDesdeXp,registrarPrueba,pruebaPendiente,abrirPrueba,CONFIG,hoyISO,verPC,cerrarSeason,verRetos,verProgreso,mostrarBienvenida,abrirPlayer,plSiguiente,enviarResumen,verNutricion,verSemana,verValoracionSemana,semanaEntreno,simPerfil,simPreviewFase,simEscenario,simSemana,verActivo,activoPick,registrarActivo,decidirRutina,pintarListaRutina,cambiarEjercicio});').call(ctx);
const A=ctx;

// ── helpers de interacción ──────────────────────────────────────────
function set(id,v){A.S?void 0:0;els[id]=els[id]||fakeEl();els[id].textContent=String(v);els[id].value=String(v);}
function jornada(dolor=2,energia=7,rpe=5){
  set('v-dolor',dolor);set('v-energia',energia);set('v-rpe',rpe);
  els['molestia']=els['molestia']||fakeEl();els['molestia'].checked=false;
  A.S.molestiaHoy = dolor>2 ? A.hoyISO() : 'no:'+A.hoyISO();   // nuevo flujo: responder "¿molestia?" antes de la escala 1-10
  A.cerrarTriaje();
  global.window._t0=Date.now()-10*60000; // simula 10 min de rutina
  A.terminarJornada();
}
function pruebaDia(marca=15){
  if(!A.pruebaPendiente())return false;
  A.abrirPrueba();set('pr-rango',marca);A.registrarPrueba();return true;
}

// ── ESCENARIO: 10 días de un paciente nuevo ─────────────────────────
let fallos=0;
const check=(cond,msg)=>{if(!cond){fallos++;console.log('❌ FALLO:',msg);}else console.log('✅',msg);};

// Día 0: alta
set('a-nombre','TestMaria');set('a-zona','cervicales');set('a-f',20);set('a-a',30);set('a-m','13');set('a-c',4);
els['a-m'].value='13';els['a-centro']=fakeEl();els['a-centro'].value='LIDOMARE26';
els['a-consent']=fakeEl();els['a-consent'].checked=true;
A.altaSubmit();
check(A.S.perfil&&A.S.perfil.nombre==='TestMaria','alta crea perfil');
check(A.S.perfil.centro==='LIDOMARE26','vinculación al centro');
check(A.S.aud>0&&A.S.aud<=100,'vitalidad provisional en rango: '+A.S.aud);
check(A.S.elemento,'elemento asignado (oculto): '+A.S.elemento);

// 10 días de uso
for(let d=1;d<=10;d++){
  pruebaDia(12+d);
  jornada(d===4?8:2,7,d===6?9:5);          // día 4 dolor alto, día 6 RPE altísimo
  check(A.S.hechoHoy===true,'día '+d+': jornada completa');
  A.diaSiguiente();
}
check(A.S.racha>=10||A.S.rachaMax>=10,'racha de 10 días: racha='+A.S.racha+' max='+(A.S.rachaMax||0));
check(A.S.ses===10,'10 sesiones: '+A.S.ses);
const fase=A.faseDesde({...A.S});
check(fase>=5,'eclosionó (fase>=5): fase '+fase+' ('+A.etapaDe(fase)+')');
check((A.S.pc||[]).length>=1,'PC tiene formas guardadas: '+(A.S.pc||[]).length);
check((A.S.pruebasHechas||[]).length===7,'7 pruebas de eclosión hechas: '+(A.S.pruebasHechas||[]).length);
check(A.S.hist.length===10,'histórico de 10 jornadas');
check(A.S.hist[3].d===8,'día 4 registró dolor 8 (alerta)');

// ruptura de racha: 3 días sin venir
A.diaSiguiente();A.diaSiguiente();A.diaSiguiente();
jornada(2,7,5);
check(A.S.racha===1,'racha se reinicia tras ausencia: '+A.S.racha);

// ── CAMINO LARGO: hasta el día 60 — ¿el ritmo de evoluciones engancha? ──
const evoluciones=[];let faseAnt=A.faseDesde({...A.S});
for(let d=14;d<=60;d++){
  jornada(Math.max(1,4-Math.floor(d/15)),7,5);   // el dolor baja con las semanas
  const f2=A.faseDesde({...A.S});
  if(f2>faseAnt){evoluciones.push('día '+d+' → fase '+f2+' ('+A.etapaDe(f2)+')');faseAnt=f2;}
  A.diaSiguiente();
}
console.log('\n📈 Evoluciones del día 14 al 60:');evoluciones.forEach(e=>console.log('  ',e));
const f60=A.faseDesde({...A.S});
check(f60>=8,'día 60: fase '+f60+' ('+A.etapaDe(f60)+') — tope actual del MVP');
console.log('   (XP total: '+A.S.xp+' · nivel '+A.nivelDesdeXp(A.S.xp)+' · sesiones '+A.S.ses+')');

// ── HUMO DE UI: ninguna pantalla debe petar al abrirse ──
const ui=[['verRetos',()=>A.verRetos()],['verPC',()=>A.verPC()],['verProgreso',()=>A.verProgreso()],
  ['mostrarBienvenida',()=>{A.mostrarBienvenida&&A.mostrarBienvenida();}],
  ['abrirPlayer',()=>{window._packHoy=A.CONFIG.pack.ejercicios;A.abrirPlayer&&A.abrirPlayer();}],
  ['plSiguiente x6',()=>{for(let i=0;i<6;i++)A.plSiguiente&&A.plSiguiente();}],
  ['enviarResumen',()=>A.enviarResumen&&A.enviarResumen()],['verNutricion',()=>A.verNutricion&&A.verNutricion()],['verSemana',()=>A.verSemana&&A.verSemana()],
  ['verValoracionSemana',()=>A.verValoracionSemana&&A.verValoracionSemana()],['simPerfil',()=>A.simPerfil&&A.simPerfil()],
  ['simEscenario(dolor)',()=>A.simEscenario&&A.simEscenario('dolor')],['simSemana',()=>A.simSemana&&A.simSemana()],
  ['verActivo',()=>A.verActivo&&A.verActivo()],['registrarActivo',()=>{A.activoPick&&A.activoPick('caminar');A.registrarActivo&&A.registrarActivo();}],
  ['cambiarEjercicio',()=>{const d=A.decidirRutina&&A.decidirRutina();if(d){global.window._packHoy=d.pack.ejercicios;A.cambiarEjercicio&&A.cambiarEjercicio(0);}}]];
ui.forEach(([n,fn])=>{try{fn();check(true,'UI '+n+' no peta');}catch(e){fallos++;console.log('❌ UI '+n+' PETA:',e.message);}});

console.log('\n'+(fallos?('🔴 '+fallos+' FALLOS'):'🟢 TODO OK')+' — últimos avisos de la app:');
LOG.slice(-3).forEach(l=>console.log('  ',l));
process.exit(fallos?1:0);
