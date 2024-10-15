"use strict";var hn=Object.create;var L=Object.defineProperty;var Sn=Object.getOwnPropertyDescriptor;var yn=Object.getOwnPropertyNames;var gn=Object.getPrototypeOf,xn=Object.prototype.hasOwnProperty;var c=(e,t)=>()=>(t||e((t={exports:{}}).exports,t),t.exports),wn=(e,t)=>{for(var r in t)L(e,r,{get:t[r],enumerable:!0})},Ee=(e,t,r,n)=>{if(t&&typeof t=="object"||typeof t=="function")for(let s of yn(t))!xn.call(e,s)&&s!==r&&L(e,s,{get:()=>t[s],enumerable:!(n=Sn(t,s))||n.enumerable});return e};var Ie=(e,t,r)=>(r=e!=null?hn(gn(e)):{},Ee(t||!e||!e.__esModule?L(r,"default",{value:e,enumerable:!0}):r,e)),bn=e=>Ee(L({},"__esModule",{value:!0}),e);var Ae=c((xs,Ge)=>{Ge.exports=Ce;Ce.sync=En;var Te=require("fs");function vn(e,t){var r=t.pathExt!==void 0?t.pathExt:process.env.PATHEXT;if(!r||(r=r.split(";"),r.indexOf("")!==-1))return!0;for(var n=0;n<r.length;n++){var s=r[n].toLowerCase();if(s&&e.substr(-s.length).toLowerCase()===s)return!0}return!1}function Pe(e,t,r){return!e.isSymbolicLink()&&!e.isFile()?!1:vn(t,r)}function Ce(e,t,r){Te.stat(e,function(n,s){r(n,n?!1:Pe(s,e,t))})}function En(e,t){return Pe(Te.statSync(e),e,t)}});var qe=c((ws,Oe)=>{Oe.exports=Re;Re.sync=In;var Ne=require("fs");function Re(e,t,r){Ne.stat(e,function(n,s){r(n,n?!1:ke(s,t))})}function In(e,t){return ke(Ne.statSync(e),t)}function ke(e,t){return e.isFile()&&Tn(e,t)}function Tn(e,t){var r=e.mode,n=e.uid,s=e.gid,o=t.uid!==void 0?t.uid:process.getuid&&process.getuid(),i=t.gid!==void 0?t.gid:process.getgid&&process.getgid(),a=parseInt("100",8),l=parseInt("010",8),d=parseInt("001",8),f=a|l,h=r&d||r&l&&s===i||r&a&&n===o||r&f&&o===0;return h}});var $e=c((vs,_e)=>{var bs=require("fs"),M;process.platform==="win32"||global.TESTING_WINDOWS?M=Ae():M=qe();_e.exports=ee;ee.sync=Pn;function ee(e,t,r){if(typeof t=="function"&&(r=t,t={}),!r){if(typeof Promise!="function")throw new TypeError("callback not provided");return new Promise(function(n,s){ee(e,t||{},function(o,i){o?s(o):n(i)})})}M(e,t||{},function(n,s){n&&(n.code==="EACCES"||t&&t.ignoreErrors)&&(n=null,s=!1),r(n,s)})}function Pn(e,t){try{return M.sync(e,t||{})}catch(r){if(t&&t.ignoreErrors||r.code==="EACCES")return!1;throw r}}});var De=c((Es,Fe)=>{var v=process.platform==="win32"||process.env.OSTYPE==="cygwin"||process.env.OSTYPE==="msys",Be=require("path"),Cn=v?";":":",Le=$e(),Me=e=>Object.assign(new Error(`not found: ${e}`),{code:"ENOENT"}),je=(e,t)=>{let r=t.colon||Cn,n=e.match(/\//)||v&&e.match(/\\/)?[""]:[...v?[process.cwd()]:[],...(t.path||process.env.PATH||"").split(r)],s=v?t.pathExt||process.env.PATHEXT||".EXE;.CMD;.BAT;.COM":"",o=v?s.split(r):[""];return v&&e.indexOf(".")!==-1&&o[0]!==""&&o.unshift(""),{pathEnv:n,pathExt:o,pathExtExe:s}},Ue=(e,t,r)=>{typeof t=="function"&&(r=t,t={}),t||(t={});let{pathEnv:n,pathExt:s,pathExtExe:o}=je(e,t),i=[],a=d=>new Promise((f,h)=>{if(d===n.length)return t.all&&i.length?f(i):h(Me(e));let m=n[d],S=/^".*"$/.test(m)?m.slice(1,-1):m,y=Be.join(S,e),g=!S&&/^\.[\\\/]/.test(e)?e.slice(0,2)+y:y;f(l(g,d,0))}),l=(d,f,h)=>new Promise((m,S)=>{if(h===s.length)return m(a(f+1));let y=s[h];Le(d+y,{pathExt:o},(g,b)=>{if(!g&&b)if(t.all)i.push(d+y);else return m(d+y);return m(l(d,f,h+1))})});return r?a(0).then(d=>r(null,d),r):a(0)},Gn=(e,t)=>{t=t||{};let{pathEnv:r,pathExt:n,pathExtExe:s}=je(e,t),o=[];for(let i=0;i<r.length;i++){let a=r[i],l=/^".*"$/.test(a)?a.slice(1,-1):a,d=Be.join(l,e),f=!l&&/^\.[\\\/]/.test(e)?e.slice(0,2)+d:d;for(let h=0;h<n.length;h++){let m=f+n[h];try{if(Le.sync(m,{pathExt:s}))if(t.all)o.push(m);else return m}catch{}}}if(t.all&&o.length)return o;if(t.nothrow)return null;throw Me(e)};Fe.exports=Ue;Ue.sync=Gn});var ne=c((Is,te)=>{"use strict";var He=(e={})=>{let t=e.env||process.env;return(e.platform||process.platform)!=="win32"?"PATH":Object.keys(t).reverse().find(n=>n.toUpperCase()==="PATH")||"Path"};te.exports=He;te.exports.default=He});var Ve=c((Ts,We)=>{"use strict";var Xe=require("path"),An=De(),Nn=ne();function Ke(e,t){let r=e.options.env||process.env,n=process.cwd(),s=e.options.cwd!=null,o=s&&process.chdir!==void 0&&!process.chdir.disabled;if(o)try{process.chdir(e.options.cwd)}catch{}let i;try{i=An.sync(e.command,{path:r[Nn({env:r})],pathExt:t?Xe.delimiter:void 0})}catch{}finally{o&&process.chdir(n)}return i&&(i=Xe.resolve(s?e.options.cwd:"",i)),i}function Rn(e){return Ke(e)||Ke(e,!0)}We.exports=Rn});var ze=c((Ps,se)=>{"use strict";var re=/([()\][%!^"`<>&|;, *?])/g;function kn(e){return e=e.replace(re,"^$1"),e}function On(e,t){return e=`${e}`,e=e.replace(/(\\*)"/g,'$1$1\\"'),e=e.replace(/(\\*)$/,"$1$1"),e=`"${e}"`,e=e.replace(re,"^$1"),t&&(e=e.replace(re,"^$1")),e}se.exports.command=kn;se.exports.argument=On});var Qe=c((Cs,Ye)=>{"use strict";Ye.exports=/^#!(.*)/});var Je=c((Gs,Ze)=>{"use strict";var qn=Qe();Ze.exports=(e="")=>{let t=e.match(qn);if(!t)return null;let[r,n]=t[0].replace(/#! ?/,"").split(" "),s=r.split("/").pop();return s==="env"?n:n?`${s} ${n}`:s}});var tt=c((As,et)=>{"use strict";var oe=require("fs"),_n=Je();function $n(e){let r=Buffer.alloc(150),n;try{n=oe.openSync(e,"r"),oe.readSync(n,r,0,150,0),oe.closeSync(n)}catch{}return _n(r.toString())}et.exports=$n});var ot=c((Ns,st)=>{"use strict";var Bn=require("path"),nt=Ve(),rt=ze(),Ln=tt(),Mn=process.platform==="win32",jn=/\.(?:com|exe)$/i,Un=/node_modules[\\/].bin[\\/][^\\/]+\.cmd$/i;function Fn(e){e.file=nt(e);let t=e.file&&Ln(e.file);return t?(e.args.unshift(e.file),e.command=t,nt(e)):e.file}function Dn(e){if(!Mn)return e;let t=Fn(e),r=!jn.test(t);if(e.options.forceShell||r){let n=Un.test(t);e.command=Bn.normalize(e.command),e.command=rt.command(e.command),e.args=e.args.map(o=>rt.argument(o,n));let s=[e.command].concat(e.args).join(" ");e.args=["/d","/s","/c",`"${s}"`],e.command=process.env.comspec||"cmd.exe",e.options.windowsVerbatimArguments=!0}return e}function Hn(e,t,r){t&&!Array.isArray(t)&&(r=t,t=null),t=t?t.slice(0):[],r=Object.assign({},r);let n={command:e,args:t,options:r,file:void 0,original:{command:e,args:t}};return r.shell?n:Dn(n)}st.exports=Hn});var ct=c((Rs,at)=>{"use strict";var ie=process.platform==="win32";function ae(e,t){return Object.assign(new Error(`${t} ${e.command} ENOENT`),{code:"ENOENT",errno:"ENOENT",syscall:`${t} ${e.command}`,path:e.command,spawnargs:e.args})}function Xn(e,t){if(!ie)return;let r=e.emit;e.emit=function(n,s){if(n==="exit"){let o=it(s,t,"spawn");if(o)return r.call(e,"error",o)}return r.apply(e,arguments)}}function it(e,t){return ie&&e===1&&!t.file?ae(t.original,"spawn"):null}function Kn(e,t){return ie&&e===1&&!t.file?ae(t.original,"spawnSync"):null}at.exports={hookChildProcess:Xn,verifyENOENT:it,verifyENOENTSync:Kn,notFoundError:ae}});var dt=c((ks,E)=>{"use strict";var ut=require("child_process"),ce=ot(),ue=ct();function lt(e,t,r){let n=ce(e,t,r),s=ut.spawn(n.command,n.args,n.options);return ue.hookChildProcess(s,n),s}function Wn(e,t,r){let n=ce(e,t,r),s=ut.spawnSync(n.command,n.args,n.options);return s.error=s.error||ue.verifyENOENTSync(s.status,n),s}E.exports=lt;E.exports.spawn=lt;E.exports.sync=Wn;E.exports._parse=ce;E.exports._enoent=ue});var pt=c((Os,ft)=>{"use strict";ft.exports=e=>{let t=typeof e=="string"?`
`:10,r=typeof e=="string"?"\r":13;return e[e.length-1]===t&&(e=e.slice(0,e.length-1)),e[e.length-1]===r&&(e=e.slice(0,e.length-1)),e}});var St=c((qs,k)=>{"use strict";var R=require("path"),mt=ne(),ht=e=>{e={cwd:process.cwd(),path:process.env[mt()],execPath:process.execPath,...e};let t,r=R.resolve(e.cwd),n=[];for(;t!==r;)n.push(R.join(r,"node_modules/.bin")),t=r,r=R.resolve(r,"..");let s=R.resolve(e.cwd,e.execPath,"..");return n.push(s),n.concat(e.path).join(R.delimiter)};k.exports=ht;k.exports.default=ht;k.exports.env=e=>{e={env:process.env,...e};let t={...e.env},r=mt({env:t});return e.path=t[r],t[r]=k.exports(e),t}});var gt=c((_s,le)=>{"use strict";var yt=(e,t)=>{for(let r of Reflect.ownKeys(t))Object.defineProperty(e,r,Object.getOwnPropertyDescriptor(t,r));return e};le.exports=yt;le.exports.default=yt});var wt=c(($s,U)=>{"use strict";var Vn=gt(),j=new WeakMap,xt=(e,t={})=>{if(typeof e!="function")throw new TypeError("Expected a function");let r,n=0,s=e.displayName||e.name||"<anonymous>",o=function(...i){if(j.set(o,++n),n===1)r=e.apply(this,i),e=null;else if(t.throw===!0)throw new Error(`Function \`${s}\` can only be called once`);return r};return Vn(o,e),j.set(o,n),o};U.exports=xt;U.exports.default=xt;U.exports.callCount=e=>{if(!j.has(e))throw new Error(`The given function \`${e.name}\` is not wrapped by the \`onetime\` package`);return j.get(e)}});var bt=c(F=>{"use strict";Object.defineProperty(F,"__esModule",{value:!0});F.SIGNALS=void 0;var zn=[{name:"SIGHUP",number:1,action:"terminate",description:"Terminal closed",standard:"posix"},{name:"SIGINT",number:2,action:"terminate",description:"User interruption with CTRL-C",standard:"ansi"},{name:"SIGQUIT",number:3,action:"core",description:"User interruption with CTRL-\\",standard:"posix"},{name:"SIGILL",number:4,action:"core",description:"Invalid machine instruction",standard:"ansi"},{name:"SIGTRAP",number:5,action:"core",description:"Debugger breakpoint",standard:"posix"},{name:"SIGABRT",number:6,action:"core",description:"Aborted",standard:"ansi"},{name:"SIGIOT",number:6,action:"core",description:"Aborted",standard:"bsd"},{name:"SIGBUS",number:7,action:"core",description:"Bus error due to misaligned, non-existing address or paging error",standard:"bsd"},{name:"SIGEMT",number:7,action:"terminate",description:"Command should be emulated but is not implemented",standard:"other"},{name:"SIGFPE",number:8,action:"core",description:"Floating point arithmetic error",standard:"ansi"},{name:"SIGKILL",number:9,action:"terminate",description:"Forced termination",standard:"posix",forced:!0},{name:"SIGUSR1",number:10,action:"terminate",description:"Application-specific signal",standard:"posix"},{name:"SIGSEGV",number:11,action:"core",description:"Segmentation fault",standard:"ansi"},{name:"SIGUSR2",number:12,action:"terminate",description:"Application-specific signal",standard:"posix"},{name:"SIGPIPE",number:13,action:"terminate",description:"Broken pipe or socket",standard:"posix"},{name:"SIGALRM",number:14,action:"terminate",description:"Timeout or timer",standard:"posix"},{name:"SIGTERM",number:15,action:"terminate",description:"Termination",standard:"ansi"},{name:"SIGSTKFLT",number:16,action:"terminate",description:"Stack is empty or overflowed",standard:"other"},{name:"SIGCHLD",number:17,action:"ignore",description:"Child process terminated, paused or unpaused",standard:"posix"},{name:"SIGCLD",number:17,action:"ignore",description:"Child process terminated, paused or unpaused",standard:"other"},{name:"SIGCONT",number:18,action:"unpause",description:"Unpaused",standard:"posix",forced:!0},{name:"SIGSTOP",number:19,action:"pause",description:"Paused",standard:"posix",forced:!0},{name:"SIGTSTP",number:20,action:"pause",description:'Paused using CTRL-Z or "suspend"',standard:"posix"},{name:"SIGTTIN",number:21,action:"pause",description:"Background process cannot read terminal input",standard:"posix"},{name:"SIGBREAK",number:21,action:"terminate",description:"User interruption with CTRL-BREAK",standard:"other"},{name:"SIGTTOU",number:22,action:"pause",description:"Background process cannot write to terminal output",standard:"posix"},{name:"SIGURG",number:23,action:"ignore",description:"Socket received out-of-band data",standard:"bsd"},{name:"SIGXCPU",number:24,action:"core",description:"Process timed out",standard:"bsd"},{name:"SIGXFSZ",number:25,action:"core",description:"File too big",standard:"bsd"},{name:"SIGVTALRM",number:26,action:"terminate",description:"Timeout or timer",standard:"bsd"},{name:"SIGPROF",number:27,action:"terminate",description:"Timeout or timer",standard:"bsd"},{name:"SIGWINCH",number:28,action:"ignore",description:"Terminal window size changed",standard:"bsd"},{name:"SIGIO",number:29,action:"terminate",description:"I/O is available",standard:"other"},{name:"SIGPOLL",number:29,action:"terminate",description:"Watched event",standard:"other"},{name:"SIGINFO",number:29,action:"ignore",description:"Request for process information",standard:"other"},{name:"SIGPWR",number:30,action:"terminate",description:"Device running out of power",standard:"systemv"},{name:"SIGSYS",number:31,action:"core",description:"Invalid system call",standard:"other"},{name:"SIGUNUSED",number:31,action:"terminate",description:"Invalid system call",standard:"other"}];F.SIGNALS=zn});var de=c(I=>{"use strict";Object.defineProperty(I,"__esModule",{value:!0});I.SIGRTMAX=I.getRealtimeSignals=void 0;var Yn=function(){let e=Et-vt+1;return Array.from({length:e},Qn)};I.getRealtimeSignals=Yn;var Qn=function(e,t){return{name:`SIGRT${t+1}`,number:vt+t,action:"terminate",description:"Application-specific signal (realtime)",standard:"posix"}},vt=34,Et=64;I.SIGRTMAX=Et});var It=c(D=>{"use strict";Object.defineProperty(D,"__esModule",{value:!0});D.getSignals=void 0;var Zn=require("os"),Jn=bt(),er=de(),tr=function(){let e=(0,er.getRealtimeSignals)();return[...Jn.SIGNALS,...e].map(nr)};D.getSignals=tr;var nr=function({name:e,number:t,description:r,action:n,forced:s=!1,standard:o}){let{signals:{[e]:i}}=Zn.constants,a=i!==void 0;return{name:e,number:a?i:t,description:r,supported:a,action:n,forced:s,standard:o}}});var Pt=c(T=>{"use strict";Object.defineProperty(T,"__esModule",{value:!0});T.signalsByNumber=T.signalsByName=void 0;var rr=require("os"),Tt=It(),sr=de(),or=function(){return(0,Tt.getSignals)().reduce(ir,{})},ir=function(e,{name:t,number:r,description:n,supported:s,action:o,forced:i,standard:a}){return{...e,[t]:{name:t,number:r,description:n,supported:s,action:o,forced:i,standard:a}}},ar=or();T.signalsByName=ar;var cr=function(){let e=(0,Tt.getSignals)(),t=sr.SIGRTMAX+1,r=Array.from({length:t},(n,s)=>ur(s,e));return Object.assign({},...r)},ur=function(e,t){let r=lr(e,t);if(r===void 0)return{};let{name:n,description:s,supported:o,action:i,forced:a,standard:l}=r;return{[e]:{name:n,number:e,description:s,supported:o,action:i,forced:a,standard:l}}},lr=function(e,t){let r=t.find(({name:n})=>rr.constants.signals[n]===e);return r!==void 0?r:t.find(n=>n.number===e)},dr=cr();T.signalsByNumber=dr});var Gt=c((Us,Ct)=>{"use strict";var{signalsByName:fr}=Pt(),pr=({timedOut:e,timeout:t,errorCode:r,signal:n,signalDescription:s,exitCode:o,isCanceled:i})=>e?`timed out after ${t} milliseconds`:i?"was canceled":r!==void 0?`failed with ${r}`:n!==void 0?`was killed with ${n} (${s})`:o!==void 0?`failed with exit code ${o}`:"failed",mr=({stdout:e,stderr:t,all:r,error:n,signal:s,exitCode:o,command:i,escapedCommand:a,timedOut:l,isCanceled:d,killed:f,parsed:{options:{timeout:h}}})=>{o=o===null?void 0:o,s=s===null?void 0:s;let m=s===void 0?void 0:fr[s].description,S=n&&n.code,g=`Command ${pr({timedOut:l,timeout:h,errorCode:S,signal:s,signalDescription:m,exitCode:o,isCanceled:d})}: ${i}`,b=Object.prototype.toString.call(n)==="[object Error]",$=b?`${g}
${n.message}`:g,B=[$,t,e].filter(Boolean).join(`
`);return b?(n.originalMessage=n.message,n.message=B):n=new Error(B),n.shortMessage=$,n.command=i,n.escapedCommand=a,n.exitCode=o,n.signal=s,n.signalDescription=m,n.stdout=e,n.stderr=t,r!==void 0&&(n.all=r),"bufferedData"in n&&delete n.bufferedData,n.failed=!0,n.timedOut=!!l,n.isCanceled=d,n.killed=f&&!l,n};Ct.exports=mr});var Nt=c((Fs,fe)=>{"use strict";var H=["stdin","stdout","stderr"],hr=e=>H.some(t=>e[t]!==void 0),At=e=>{if(!e)return;let{stdio:t}=e;if(t===void 0)return H.map(n=>e[n]);if(hr(e))throw new Error(`It's not possible to provide \`stdio\` in combination with one of ${H.map(n=>`\`${n}\``).join(", ")}`);if(typeof t=="string")return t;if(!Array.isArray(t))throw new TypeError(`Expected \`stdio\` to be of type \`string\` or \`Array\`, got \`${typeof t}\``);let r=Math.max(t.length,H.length);return Array.from({length:r},(n,s)=>t[s])};fe.exports=At;fe.exports.node=e=>{let t=At(e);return t==="ipc"?"ipc":t===void 0||typeof t=="string"?[t,t,t,"ipc"]:t.includes("ipc")?t:[...t,"ipc"]}});var Rt=c((Ds,X)=>{X.exports=["SIGABRT","SIGALRM","SIGHUP","SIGINT","SIGTERM"];process.platform!=="win32"&&X.exports.push("SIGVTALRM","SIGXCPU","SIGXFSZ","SIGUSR2","SIGTRAP","SIGSYS","SIGQUIT","SIGIOT");process.platform==="linux"&&X.exports.push("SIGIO","SIGPOLL","SIGPWR","SIGSTKFLT","SIGUNUSED")});var $t=c((Hs,G)=>{var u=global.process;typeof u!="object"||!u?G.exports=function(){}:(kt=require("assert"),P=Rt(),Ot=/^win/i.test(u.platform),O=require("events"),typeof O!="function"&&(O=O.EventEmitter),u.__signal_exit_emitter__?p=u.__signal_exit_emitter__:(p=u.__signal_exit_emitter__=new O,p.count=0,p.emitted={}),p.infinite||(p.setMaxListeners(1/0),p.infinite=!0),G.exports=function(e,t){if(global.process===u){kt.equal(typeof e,"function","a callback must be provided for exit handler"),C===!1&&pe();var r="exit";t&&t.alwaysLast&&(r="afterexit");var n=function(){p.removeListener(r,e),p.listeners("exit").length===0&&p.listeners("afterexit").length===0&&K()};return p.on(r,e),n}},K=function(){!C||global.process!==u||(C=!1,P.forEach(function(t){try{u.removeListener(t,W[t])}catch{}}),u.emit=V,u.reallyExit=me,p.count-=1)},G.exports.unload=K,w=function(t,r,n){p.emitted[t]||(p.emitted[t]=!0,p.emit(t,r,n))},W={},P.forEach(function(e){W[e]=function(){if(u===global.process){var r=u.listeners(e);r.length===p.count&&(K(),w("exit",null,e),w("afterexit",null,e),Ot&&e==="SIGHUP"&&(e="SIGINT"),u.kill(u.pid,e))}}}),G.exports.signals=function(){return P},C=!1,pe=function(){C||u!==global.process||(C=!0,p.count+=1,P=P.filter(function(t){try{return u.on(t,W[t]),!0}catch{return!1}}),u.emit=_t,u.reallyExit=qt)},G.exports.load=pe,me=u.reallyExit,qt=function(t){u===global.process&&(u.exitCode=t||0,w("exit",u.exitCode,null),w("afterexit",u.exitCode,null),me.call(u,u.exitCode))},V=u.emit,_t=function(t,r){if(t==="exit"&&u===global.process){r!==void 0&&(u.exitCode=r);var n=V.apply(this,arguments);return w("exit",u.exitCode,null),w("afterexit",u.exitCode,null),n}else return V.apply(this,arguments)});var kt,P,Ot,O,p,K,w,W,C,pe,me,qt,V,_t});var Lt=c((Xs,Bt)=>{"use strict";var Sr=require("os"),yr=$t(),gr=1e3*5,xr=(e,t="SIGTERM",r={})=>{let n=e(t);return wr(e,t,r,n),n},wr=(e,t,r,n)=>{if(!br(t,r,n))return;let s=Er(r),o=setTimeout(()=>{e("SIGKILL")},s);o.unref&&o.unref()},br=(e,{forceKillAfterTimeout:t},r)=>vr(e)&&t!==!1&&r,vr=e=>e===Sr.constants.signals.SIGTERM||typeof e=="string"&&e.toUpperCase()==="SIGTERM",Er=({forceKillAfterTimeout:e=!0})=>{if(e===!0)return gr;if(!Number.isFinite(e)||e<0)throw new TypeError(`Expected the \`forceKillAfterTimeout\` option to be a non-negative integer, got \`${e}\` (${typeof e})`);return e},Ir=(e,t)=>{e.kill()&&(t.isCanceled=!0)},Tr=(e,t,r)=>{e.kill(t),r(Object.assign(new Error("Timed out"),{timedOut:!0,signal:t}))},Pr=(e,{timeout:t,killSignal:r="SIGTERM"},n)=>{if(t===0||t===void 0)return n;let s,o=new Promise((a,l)=>{s=setTimeout(()=>{Tr(e,r,l)},t)}),i=n.finally(()=>{clearTimeout(s)});return Promise.race([o,i])},Cr=({timeout:e})=>{if(e!==void 0&&(!Number.isFinite(e)||e<0))throw new TypeError(`Expected the \`timeout\` option to be a non-negative integer, got \`${e}\` (${typeof e})`)},Gr=async(e,{cleanup:t,detached:r},n)=>{if(!t||r)return n;let s=yr(()=>{e.kill()});return n.finally(()=>{s()})};Bt.exports={spawnedKill:xr,spawnedCancel:Ir,setupTimeout:Pr,validateTimeout:Cr,setExitHandler:Gr}});var jt=c((Ks,Mt)=>{"use strict";var x=e=>e!==null&&typeof e=="object"&&typeof e.pipe=="function";x.writable=e=>x(e)&&e.writable!==!1&&typeof e._write=="function"&&typeof e._writableState=="object";x.readable=e=>x(e)&&e.readable!==!1&&typeof e._read=="function"&&typeof e._readableState=="object";x.duplex=e=>x.writable(e)&&x.readable(e);x.transform=e=>x.duplex(e)&&typeof e._transform=="function";Mt.exports=x});var Ft=c((Ws,Ut)=>{"use strict";var{PassThrough:Ar}=require("stream");Ut.exports=e=>{e={...e};let{array:t}=e,{encoding:r}=e,n=r==="buffer",s=!1;t?s=!(r||n):r=r||"utf8",n&&(r=null);let o=new Ar({objectMode:s});r&&o.setEncoding(r);let i=0,a=[];return o.on("data",l=>{a.push(l),s?i=a.length:i+=l.length}),o.getBufferedValue=()=>t?a:n?Buffer.concat(a,i):a.join(""),o.getBufferedLength=()=>i,o}});var Dt=c((Vs,q)=>{"use strict";var{constants:Nr}=require("buffer"),Rr=require("stream"),{promisify:kr}=require("util"),Or=Ft(),qr=kr(Rr.pipeline),z=class extends Error{constructor(){super("maxBuffer exceeded"),this.name="MaxBufferError"}};async function he(e,t){if(!e)throw new Error("Expected a stream");t={maxBuffer:1/0,...t};let{maxBuffer:r}=t,n=Or(t);return await new Promise((s,o)=>{let i=a=>{a&&n.getBufferedLength()<=Nr.MAX_LENGTH&&(a.bufferedData=n.getBufferedValue()),o(a)};(async()=>{try{await qr(e,n),s()}catch(a){i(a)}})(),n.on("data",()=>{n.getBufferedLength()>r&&i(new z)})}),n.getBufferedValue()}q.exports=he;q.exports.buffer=(e,t)=>he(e,{...t,encoding:"buffer"});q.exports.array=(e,t)=>he(e,{...t,array:!0});q.exports.MaxBufferError=z});var Xt=c((zs,Ht)=>{"use strict";var{PassThrough:_r}=require("stream");Ht.exports=function(){var e=[],t=new _r({objectMode:!0});return t.setMaxListeners(0),t.add=r,t.isEmpty=n,t.on("unpipe",s),Array.prototype.slice.call(arguments).forEach(r),t;function r(o){return Array.isArray(o)?(o.forEach(r),this):(e.push(o),o.once("end",s.bind(null,o)),o.once("error",t.emit.bind(t,"error")),o.pipe(t,{end:!1}),this)}function n(){return e.length==0}function s(o){e=e.filter(function(i){return i!==o}),!e.length&&t.readable&&t.end()}}});var zt=c((Ys,Vt)=>{"use strict";var Wt=jt(),Kt=Dt(),$r=Xt(),Br=(e,t)=>{t===void 0||e.stdin===void 0||(Wt(t)?t.pipe(e.stdin):e.stdin.end(t))},Lr=(e,{all:t})=>{if(!t||!e.stdout&&!e.stderr)return;let r=$r();return e.stdout&&r.add(e.stdout),e.stderr&&r.add(e.stderr),r},Se=async(e,t)=>{if(e){e.destroy();try{return await t}catch(r){return r.bufferedData}}},ye=(e,{encoding:t,buffer:r,maxBuffer:n})=>{if(!(!e||!r))return t?Kt(e,{encoding:t,maxBuffer:n}):Kt.buffer(e,{maxBuffer:n})},Mr=async({stdout:e,stderr:t,all:r},{encoding:n,buffer:s,maxBuffer:o},i)=>{let a=ye(e,{encoding:n,buffer:s,maxBuffer:o}),l=ye(t,{encoding:n,buffer:s,maxBuffer:o}),d=ye(r,{encoding:n,buffer:s,maxBuffer:o*2});try{return await Promise.all([i,a,l,d])}catch(f){return Promise.all([{error:f,signal:f.signal,timedOut:f.timedOut},Se(e,a),Se(t,l),Se(r,d)])}},jr=({input:e})=>{if(Wt(e))throw new TypeError("The `input` option cannot be a stream in sync mode")};Vt.exports={handleInput:Br,makeAllStream:Lr,getSpawnedResult:Mr,validateInputSync:jr}});var Qt=c((Qs,Yt)=>{"use strict";var Ur=(async()=>{})().constructor.prototype,Fr=["then","catch","finally"].map(e=>[e,Reflect.getOwnPropertyDescriptor(Ur,e)]),Dr=(e,t)=>{for(let[r,n]of Fr){let s=typeof t=="function"?(...o)=>Reflect.apply(n.value,t(),o):n.value.bind(t);Reflect.defineProperty(e,r,{...n,value:s})}return e},Hr=e=>new Promise((t,r)=>{e.on("exit",(n,s)=>{t({exitCode:n,signal:s})}),e.on("error",n=>{r(n)}),e.stdin&&e.stdin.on("error",n=>{r(n)})});Yt.exports={mergePromise:Dr,getSpawnedPromise:Hr}});var en=c((Zs,Jt)=>{"use strict";var Zt=(e,t=[])=>Array.isArray(t)?[e,...t]:[e],Xr=/^[\w.-]+$/,Kr=/"/g,Wr=e=>typeof e!="string"||Xr.test(e)?e:`"${e.replace(Kr,'\\"')}"`,Vr=(e,t)=>Zt(e,t).join(" "),zr=(e,t)=>Zt(e,t).map(r=>Wr(r)).join(" "),Yr=/ +/g,Qr=e=>{let t=[];for(let r of e.trim().split(Yr)){let n=t[t.length-1];n&&n.endsWith("\\")?t[t.length-1]=`${n.slice(0,-1)} ${r}`:t.push(r)}return t};Jt.exports={joinCommand:Vr,getEscapedCommand:zr,parseCommand:Qr}});var cn=c((Js,A)=>{"use strict";var Zr=require("path"),ge=require("child_process"),Jr=dt(),es=pt(),ts=St(),ns=wt(),Y=Gt(),nn=Nt(),{spawnedKill:rs,spawnedCancel:ss,setupTimeout:os,validateTimeout:is,setExitHandler:as}=Lt(),{handleInput:cs,getSpawnedResult:us,makeAllStream:ls,validateInputSync:ds}=zt(),{mergePromise:tn,getSpawnedPromise:fs}=Qt(),{joinCommand:rn,parseCommand:sn,getEscapedCommand:on}=en(),ps=1e3*1e3*100,ms=({env:e,extendEnv:t,preferLocal:r,localDir:n,execPath:s})=>{let o=t?{...process.env,...e}:e;return r?ts.env({env:o,cwd:n,execPath:s}):o},an=(e,t,r={})=>{let n=Jr._parse(e,t,r);return e=n.command,t=n.args,r=n.options,r={maxBuffer:ps,buffer:!0,stripFinalNewline:!0,extendEnv:!0,preferLocal:!1,localDir:r.cwd||process.cwd(),execPath:process.execPath,encoding:"utf8",reject:!0,cleanup:!0,all:!1,windowsHide:!0,...r},r.env=ms(r),r.stdio=nn(r),process.platform==="win32"&&Zr.basename(e,".exe")==="cmd"&&t.unshift("/q"),{file:e,args:t,options:r,parsed:n}},_=(e,t,r)=>typeof t!="string"&&!Buffer.isBuffer(t)?r===void 0?void 0:"":e.stripFinalNewline?es(t):t,Q=(e,t,r)=>{let n=an(e,t,r),s=rn(e,t),o=on(e,t);is(n.options);let i;try{i=ge.spawn(n.file,n.args,n.options)}catch(S){let y=new ge.ChildProcess,g=Promise.reject(Y({error:S,stdout:"",stderr:"",all:"",command:s,escapedCommand:o,parsed:n,timedOut:!1,isCanceled:!1,killed:!1}));return tn(y,g)}let a=fs(i),l=os(i,n.options,a),d=as(i,n.options,l),f={isCanceled:!1};i.kill=rs.bind(null,i.kill.bind(i)),i.cancel=ss.bind(null,i,f);let m=ns(async()=>{let[{error:S,exitCode:y,signal:g,timedOut:b},$,B,mn]=await us(i,n.options,d),xe=_(n.options,$),we=_(n.options,B),be=_(n.options,mn);if(S||y!==0||g!==null){let ve=Y({error:S,exitCode:y,signal:g,stdout:xe,stderr:we,all:be,command:s,escapedCommand:o,parsed:n,timedOut:b,isCanceled:f.isCanceled,killed:i.killed});if(!n.options.reject)return ve;throw ve}return{command:s,escapedCommand:o,exitCode:0,stdout:xe,stderr:we,all:be,failed:!1,timedOut:!1,isCanceled:!1,killed:!1}});return cs(i,n.options.input),i.all=ls(i,n.options),tn(i,m)};A.exports=Q;A.exports.sync=(e,t,r)=>{let n=an(e,t,r),s=rn(e,t),o=on(e,t);ds(n.options);let i;try{i=ge.spawnSync(n.file,n.args,n.options)}catch(d){throw Y({error:d,stdout:"",stderr:"",all:"",command:s,escapedCommand:o,parsed:n,timedOut:!1,isCanceled:!1,killed:!1})}let a=_(n.options,i.stdout,i.error),l=_(n.options,i.stderr,i.error);if(i.error||i.status!==0||i.signal!==null){let d=Y({stdout:a,stderr:l,error:i.error,signal:i.signal,exitCode:i.status,command:s,escapedCommand:o,parsed:n,timedOut:i.error&&i.error.code==="ETIMEDOUT",isCanceled:!1,killed:i.signal!==null});if(!n.options.reject)return d;throw d}return{command:s,escapedCommand:o,exitCode:0,stdout:a,stderr:l,failed:!1,timedOut:!1,isCanceled:!1,killed:!1}};A.exports.command=(e,t)=>{let[r,...n]=sn(e);return Q(r,n,t)};A.exports.commandSync=(e,t)=>{let[r,...n]=sn(e);return Q.sync(r,n,t)};A.exports.node=(e,t,r={})=>{t&&!Array.isArray(t)&&typeof t=="object"&&(r=t,t=[]);let n=nn.node(r),s=process.execArgv.filter(a=>!a.startsWith("--inspect")),{nodePath:o=process.execPath,nodeOptions:i=s}=r;return Q(o,[...i,e,...Array.isArray(t)?t:[]],{...r,stdin:void 0,stdout:void 0,stderr:void 0,stdio:n,shell:!1})}});var ys={};wn(ys,{default:()=>Ss});module.exports=bn(ys);var N=require("@raycast/api");var un=Ie(require("node:process"),1),ln=Ie(cn(),1);async function Z(e){if(un.default.platform!=="darwin")throw new Error("macOS only");let{stdout:t}=await(0,ln.default)("osascript",["-e",e]);return t}function dn(e){return`
    tell application "Spotify"
      if not application "Spotify" is running then
        activate

        set _maxOpenWaitTimeInSeconds to 5
        set _openCounter to 1
        repeat until application "Spotify" is running
          delay 1
          set _openCounter to _openCounter + 1
          if _openCounter > _maxOpenWaitTimeInSeconds then exit repeat
        end repeat
      end if
      ${e}
    end tell`}async function fn(e){if(await(0,N.closeMainWindow)(),!(await(0,N.getApplications)()).some(n=>n.name==="Spotify")){await(0,N.showHUD)("Spotify is not installed");return}await Z(e)}var J=require("@raycast/api");async function pn(){(0,J.getPreferenceValues)().previousTrackNotificationEnabled!==!1&&await hs()}async function hs(){let e=`
      if application "Spotify" is not running then
          return "Not playing"
      end if

      property currentTrackName : "Unknown Track"
      property currentTrackArtist : "Unknown Artist"
      property playerState : "stopped"

      tell application "Spotify"
          try
              set currentTrackName to name of the current track
              set currentTrackArtist to artist of the current track
              set playerState to player state as string
          end try
      end tell

      if playerState is "playing" then
        return currentTrackName & " by " & currentTrackArtist
      else if playerState is "paused" then
          return currentTrackName & " by " & currentTrackArtist & " (Paused)"
      else
          return "Not playing"
      end if`;try{let t=await Z(e);await(0,J.showHUD)("\u{1F3A7} "+t)}catch(t){console.error(t)}}var Ss=async()=>{let e=dn("previous track");await fn(e),await pn()};
