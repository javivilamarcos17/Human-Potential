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
global.navigator={};global.window={};global.crypto={randomUUID:()=>'test-uuid'};
global.alert=m=>LOG.push('ALERT: '+String(m).slice(0,90));
global.confirm=()=>true;global.fetch=()=>Promise.resolve({ok:true});
global.location={reload(){},href:''};
const LOG=[];

// ── cargar la app ───────────────────────────────────────────────────
const ctx={};
new Function(js+'\n;Object.assign(this,{S,save,altaSubmit,cerrarTriaje,terminarJornada,diaSiguiente,faseDesde,etapaDe,nivelDesdeXp,registrarPrueba,pruebaPendiente,abrirPrueba,CONFIG,hoyISO,verPC,cerrarSeason});').call(ctx);
const A=ctx;

// ── helpers de interacción ──────────────────────────────────────────
function set(id,v){A.S?void 0:0;els[id]=els[id]||fakeEl();els[id].textContent=String(v);els[id].value=String(v);}
function jornada(dolor=2,energia=7,rpe=5){
  set('v-dolor',dolor);set('v-energia',energia);set('v-rpe',rpe);
  els['molestia']=els['molestia']||fakeEl();els['molestia'].checked=false;
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

console.log('\n'+(fallos?('🔴 '+fallos+' FALLOS'):'🟢 TODO OK')+' — últimos avisos de la app:');
LOG.slice(-3).forEach(l=>console.log('  ',l));
process.exit(fallos?1:0);
