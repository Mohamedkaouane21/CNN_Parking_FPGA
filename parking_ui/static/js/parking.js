function updZoom(){document.getElementById('zdsp').textContent=`${Math.round(S.sc*100)}%`;}
function ptInPoly([px,py],poly){let ins=false;for(let i=0,j=poly.length-1;i<poly.length;j=i++){const[xi,yi]=poly[i],[xj,yj]=poly[j];if(((yi>py)!==(yj>py))&&(px<(xj-xi)*(py-yi)/(yj-yi)+xi))ins=!ins;}return ins;}
function toast(msg,type='',dur=3500){const t=document.getElementById('toast');t.textContent=msg;t.className=`on ${type}`;clearTimeout(t._t);t._t=setTimeout(()=>t.className='',dur);}
function showLoad(s){document.getElementById('ld').classList.toggle('on',s);}
function showOverlay(id, title, subtitle){
  const el = document.getElementById(id);
  if(!el) return;
  el.innerHTML = `<div class="so-title" style="font-size:16px">${title}</div><div class="so-sub">${subtitle}</div>`;
  el.classList.remove('hidden');
}
function showOverlayLoading(id, text){
  const el = document.getElementById(id);
  if(!el) return;
  el.innerHTML = `<div class="spin"></div><div class="so-sub">${text}</div>`;
  el.classList.remove('hidden');
}
function toggleSidebar(id){
  const el = document.getElementById(id);
  const btn = el.querySelector('.sidebar-toggle');
  const isCollapsed = el.classList.toggle('collapsed');
  btn.textContent = isCollapsed ? '▼ Menu' : '▲ Masquer';
  if(id === 'editorSidebar' && typeof resize === 'function') setTimeout(resize, 100);
  if(id === 'liveSidebar' && typeof resizeLive === 'function') setTimeout(resizeLive, 100);
}
let _lastCamAlert = null;
let _alertDismissed = false;
let _alertBeepInterval = null;
let _audioCtx = null;
function _getAudioCtx(){
  if(!_audioCtx){
    try{ _audioCtx = new (window.AudioContext || window.webkitAudioContext)(); }catch(e){}
  }
  if(_audioCtx && _audioCtx.state === 'suspended') _audioCtx.resume();
  return _audioCtx;
}
document.addEventListener('touchstart', function(){ _getAudioCtx(); }, {once:true});
document.addEventListener('click', function(){ _getAudioCtx(); }, {once:true});
function _beep(freq, duration){
  try{
    const ctx = _getAudioCtx();
    if(!ctx) return;
    const osc = ctx.createOscillator();
    const gain = ctx.createGain();
    osc.connect(gain); gain.connect(ctx.destination);
    osc.frequency.value = freq;
    gain.gain.value = 0.15;
    osc.start(); osc.stop(ctx.currentTime + duration/1000);
  }catch(e){}
}
function handleCamAlert(alertType){
  const banner = document.getElementById('camAlertBanner');
  const text = document.getElementById('camAlertText');
  if(!alertType){
    if(_lastCamAlert){
      banner.style.display = 'none';
      _alertDismissed = false;
      if(_alertBeepInterval){ clearInterval(_alertBeepInterval); _alertBeepInterval = null; }
    }
    _lastCamAlert = null;
    return;
  }
  if(alertType !== _lastCamAlert){
    _alertDismissed = false;
    if(_alertBeepInterval){ clearInterval(_alertBeepInterval); _alertBeepInterval = null; }
    if(alertType === 'noir'){
      _beep(800, 200); setTimeout(()=>_beep(600, 300), 250);
      _alertBeepInterval = setInterval(()=>{ _beep(800, 200); setTimeout(()=>_beep(600, 300), 250); }, 15000);
    } else if(alertType === 'figé'){
      _beep(500, 300);
      _alertBeepInterval = setInterval(()=>_beep(500, 300), 30000);
    } else if(alertType === 'error'){
      _beep(400, 400);
      _alertBeepInterval = setInterval(()=>_beep(400, 400), 20000);
    }
  }
  _lastCamAlert = alertType;
  if(_alertDismissed) return;
  if(alertType === 'noir'){
    banner.style.background = '#c0392b';
    banner.style.color = '#fff';
    text.textContent = 'ALERTE : Image noire — Vérifiez la caméra';
  } else if(alertType === 'figé'){
    banner.style.background = '#e67e22';
    banner.style.color = '#fff';
    text.textContent = 'Image figée — Le flux semble bloqué';
  } else if(alertType === 'error'){
    banner.style.background = '#e67e22';
    banner.style.color = '#fff';
    text.textContent = 'Flux perdu — Reconnexion en cours...';
  }
  banner.style.display = '';
}
function dismissCamAlert(){
  document.getElementById('camAlertBanner').style.display = 'none';
  _alertDismissed = true;
  if(_alertBeepInterval){ clearInterval(_alertBeepInterval); _alertBeepInterval = null; }
}
const vidState = {
  live: {sc:1, tx:0, ty:0, dragging:false, px:0, py:0},
  demo: {sc:1, tx:0, ty:0, dragging:false, px:0, py:0},
};
function vidApply(id){
  const s = vidState[id];
  const wrap = document.getElementById(id==='live'?'liveWrap':'demoWrap');
  const lbl  = document.getElementById(id==='live'?'lZoomLbl':'dZoomLbl');
  wrap.style.transform = `translate(${s.tx}px,${s.ty}px) scale(${s.sc})`;
  lbl.textContent = Math.round(s.sc*100)+'%';
  const cont = document.getElementById(id==='live'?'liveContainer':'demoContainer');
  cont.classList.toggle('zoomed', s.sc > 1);
}
function vidZoom(id, delta){
  const s = vidState[id];
  s.sc = Math.max(0.25, Math.min(8, s.sc + delta));
  if(s.sc === 1){ s.tx=0; s.ty=0; }
  vidApply(id);
}
function vidReset(id){
  const s = vidState[id];
  s.sc=1; s.tx=0; s.ty=0;
  vidApply(id);
}
function vidWheel(e, id){
  e.preventDefault();
  const s = vidState[id];
  const cont = document.getElementById(id==='live'?'liveContainer':'demoContainer');
  const rect = cont.getBoundingClientRect();
  const mx = e.clientX - rect.left - rect.width/2;
  const my = e.clientY - rect.top  - rect.height/2;
  const delta = e.deltaY > 0 ? -0.15 : 0.15;
  const newSc = Math.max(0.25, Math.min(8, s.sc + delta));
  s.tx = mx - (mx - s.tx) * (newSc / s.sc);
  s.ty = my - (my - s.ty) * (newSc / s.sc);
  s.sc = newSc;
  if(s.sc === 1){ s.tx=0; s.ty=0; }
  vidApply(id);
}
function vidDragStart(e, id){
  if(e.button === 1){
    e.preventDefault();
  } else if(e.button === 0){
    if(vidState[id].sc <= 1) return;
  } else {
    return;
  }
  const s = vidState[id];
  s.dragging=true; s.px=e.clientX; s.py=e.clientY;
  e.preventDefault();
}
function vidDragMove(e, id){
  const s = vidState[id];
  if(!s.dragging) return;
  s.tx += e.clientX - s.px;
  s.ty += e.clientY - s.py;
  s.px = e.clientX; s.py = e.clientY;
  vidApply(id);
}
function vidDragEnd(id){
  vidState[id].dragging = false;
}
function vidFullscreen(containerId){
  const el = document.getElementById(containerId);
  const fsEl = document.fullscreenElement || document.webkitFullscreenElement || document.mozFullScreenElement;
  if(!fsEl){
    const rfs = el.requestFullscreen || el.webkitRequestFullscreen || el.mozRequestFullScreen || el.msRequestFullscreen;
    if(rfs){
      rfs.call(el).catch(()=>{ cssFullscreen(el); });
    } else {
      cssFullscreen(el);
    }
  } else {
    const efs = document.exitFullscreen || document.webkitExitFullscreen || document.mozCancelFullScreen || document.msExitFullscreen;
    if(efs) efs.call(document);
  }
}
function cssFullscreen(el){
  if(el.classList.contains('css-fullscreen')){
    exitCssFullscreen(el);
  } else {
    el.classList.add('css-fullscreen');
    document.body.style.overflow = 'hidden';
    let btn = document.getElementById('cssFsCloseBtn');
    if(!btn){
      btn = document.createElement('div');
      btn.id = 'cssFsCloseBtn';
      btn.className = 'css-fs-close';
      btn.innerHTML = 'Quitter plein écran';
      document.body.appendChild(btn);
    }
    btn.style.display = 'block';
    btn.onclick = function(e){ e.stopPropagation(); e.preventDefault(); exitCssFullscreen(el); };
    btn.ontouchend = function(e){ e.stopPropagation(); e.preventDefault(); exitCssFullscreen(el); };
    document.addEventListener('keydown', _cssFsKey);
    _cssFsEl = el;
    setTimeout(function(){ if(typeof resize === 'function') resize(); }, 100);
  }
}
let _cssFsEl = null;
function _cssFsKey(e){ if(e.key==='Escape' && _cssFsEl) exitCssFullscreen(_cssFsEl); }
function exitCssFullscreen(el){
  el.classList.remove('css-fullscreen');
  document.body.style.overflow = '';
  const btn = document.getElementById('cssFsCloseBtn');
  if(btn) btn.style.display = 'none';
  document.removeEventListener('keydown', _cssFsKey);
  _cssFsEl = null;
  setTimeout(function(){ if(typeof resize === 'function') resize(); }, 100);
}
let _touchState = {};
function vidTouchStart(e, id){
  if(e.touches.length === 2){
    e.preventDefault();
    const s = vidState[id];
    s.dragging = false; // Annuler le pan en cours
    const dx = e.touches[0].clientX - e.touches[1].clientX;
    const dy = e.touches[0].clientY - e.touches[1].clientY;
    const cont = document.getElementById(id==='live'?'liveContainer':'demoContainer');
    const rect = cont.getBoundingClientRect();
    const mx = (e.touches[0].clientX + e.touches[1].clientX) / 2 - rect.left;
    const my = (e.touches[0].clientY + e.touches[1].clientY) / 2 - rect.top;
    _touchState[id] = {dist: Math.sqrt(dx*dx+dy*dy), sc: s.sc, tx: s.tx, ty: s.ty, mx: mx, my: my};
  } else if(e.touches.length === 1 && vidState[id].sc > 1){
    e.preventDefault();
    const s = vidState[id];
    s.dragging = true;
    s.px = e.touches[0].clientX;
    s.py = e.touches[0].clientY;
  }
}
function vidTouchMove(e, id){
  const s = vidState[id];
  if(e.touches.length === 2 && _touchState[id]){
    e.preventDefault();
    const dx = e.touches[0].clientX - e.touches[1].clientX;
    const dy = e.touches[0].clientY - e.touches[1].clientY;
    const dist = Math.sqrt(dx*dx+dy*dy);
    const newSc = Math.max(0.5, Math.min(6, _touchState[id].sc * (dist / _touchState[id].dist)));
    const mx = _touchState[id].mx, my = _touchState[id].my;
    s.tx = mx - (mx - _touchState[id].tx) * (newSc / _touchState[id].sc);
    s.ty = my - (my - _touchState[id].ty) * (newSc / _touchState[id].sc);
    s.sc = newSc;
    if(s.sc <= 1.05){ s.sc=1; s.tx=0; s.ty=0; }
    vidApply(id);
  } else if(e.touches.length === 1 && s.dragging){
    e.preventDefault();
    s.tx += e.touches[0].clientX - s.px;
    s.ty += e.touches[0].clientY - s.py;
    s.px = e.touches[0].clientX;
    s.py = e.touches[0].clientY;
    vidApply(id);
  }
}
function vidTouchEnd(e, id){
  if(e.touches.length < 2) _touchState[id] = null;
  if(e.touches.length === 0) vidState[id].dragging = false;
}
async function toggleMask(enabled){
  try{
    await fetch('/api/live/mask', {method:'POST', headers:{'Content-Type':'application/json'}, body:JSON.stringify({enabled})});
  }catch(e){ toast('Erreur','err'); }
}
async function toggleYolo(enabled){
  try{
    await fetch('/api/live/yolo', {method:'POST', headers:{'Content-Type':'application/json'}, body:JSON.stringify({enabled})});
  }catch(e){ toast('Erreur','err'); }
}
let dpTimer = null, dhTimer = null, vwTimer = null;
function dpChanged(val){
  document.getElementById('dpVal').textContent = val + '%';
  clearTimeout(dpTimer);
  dpTimer = setTimeout(()=>{
    fetch('/api/live/detection', {method:'POST', headers:{'Content-Type':'application/json'}, body:JSON.stringify({detect_point:parseInt(val)})});
  }, 200);
}
function dhChanged(val){
  document.getElementById('dhVal').textContent = val + '%';
  clearTimeout(dhTimer);
  dhTimer = setTimeout(()=>{
    fetch('/api/live/detection', {method:'POST', headers:{'Content-Type':'application/json'}, body:JSON.stringify({detect_horizontal:parseInt(val)})});
  }, 200);
}
function vwChanged(val){
  document.getElementById('vwVal').textContent = val;
  clearTimeout(vwTimer);
  vwTimer = setTimeout(()=>{
    fetch('/api/live/detection', {method:'POST', headers:{'Content-Type':'application/json'}, body:JSON.stringify({vote_window:parseInt(val)})});
  }, 200);
}
async function loadDetectionSettings(){
  try{
    const s = await fetch('/api/live/detection').then(r=>r.json());
    document.getElementById('dpSlider').value = s.detect_point;
    document.getElementById('dpVal').textContent = s.detect_point + '%';
    document.getElementById('dhSlider').value = s.detect_horizontal;
    document.getElementById('dhVal').textContent = s.detect_horizontal + '%';
    document.getElementById('vwSlider').value = s.vote_window;
    document.getElementById('vwVal').textContent = s.vote_window;
    if('yolo_enabled' in s) document.getElementById('yoloToggle').checked = s.yolo_enabled;
    if('mask_enabled' in s) document.getElementById('maskToggle').checked = s.mask_enabled;
  }catch(e){}
  try{
    const sel = document.getElementById('camSel');
    if(sel && sel.value){
      const r = await fetch('/api/cameras/active_mask?cam_id='+encodeURIComponent(sel.value)).then(r=>r.json());
      document.getElementById('lActiveMask').textContent = r.active_mask || 'aucun';
    }
  }catch(e){}
}
async function openAdvanced(){
  try{
    const s = await fetch('/api/settings').then(r=>r.json());
    document.getElementById('advConf').value = s.conf_threshold;
    document.getElementById('advNms').value = s.nms_threshold;
    document.getElementById('advFps').value = s.stream_fps;
    document.getElementById('advProcess').value = s.process_every;
    document.getElementById('advJpeg').value = s.jpeg_quality;
    document.getElementById('advVoteThresh').value = s.vote_threshold;
    document.getElementById('advXbeeEnabled').checked = s.xbee_enabled || false;
    document.getElementById('advXbeePort').value = s.xbee_port || 'auto';
    document.getElementById('advXbeeBaud').value = s.xbee_baud || 115200;
    document.getElementById('advXbeeInterval').value = s.xbee_interval || 30;
    const st = await fetch('/api/live/stats').then(r=>r.json());
    const xs = document.getElementById('xbeeStatus');
    if(st.xbee_active){ xs.textContent = 'XBee actif'; xs.style.color = 'var(--green)'; }
    else if(s.xbee_enabled){ xs.textContent = 'XBee activé mais non connecté'; xs.style.color = 'var(--yellow)'; }
    else { xs.textContent = 'XBee désactivé'; xs.style.color = 'var(--text-dim)'; }
  }catch(e){}
  document.getElementById('advDetection').style.display = 'none';
  document.getElementById('advDetectionChev').style.transform = 'rotate(-90deg)';
  document.getElementById('advXbee').style.display = 'none';
  document.getElementById('advXbeeChev').style.transform = 'rotate(-90deg)';
  document.getElementById('advModal').classList.add('on');
}
function closeAdvanced(){
  document.getElementById('advModal').classList.remove('on');
}
async function saveAdvanced(){
  const data = {
    conf_threshold: parseFloat(document.getElementById('advConf').value),
    nms_threshold:  parseFloat(document.getElementById('advNms').value),
    stream_fps:     parseInt(document.getElementById('advFps').value),
    process_every:  parseInt(document.getElementById('advProcess').value),
    jpeg_quality:   parseInt(document.getElementById('advJpeg').value),
    vote_threshold: parseFloat(document.getElementById('advVoteThresh').value),
    xbee_port:      document.getElementById('advXbeePort').value.trim(),
    xbee_baud:      parseInt(document.getElementById('advXbeeBaud').value),
    xbee_interval:  parseInt(document.getElementById('advXbeeInterval').value),
  };
  try{
    await fetch('/api/settings', {method:'POST', headers:{'Content-Type':'application/json'}, body:JSON.stringify(data)});
    toast('Réglages enregistrés', 'ok');
    closeAdvanced();
  }catch(e){ toast('Erreur','err'); }
}
async function toggleXbee(enabled){
  try{
    if(enabled){
      await fetch('/api/xbee/start', {method:'POST'});
      toast('XBee activé', 'ok');
    } else {
      await fetch('/api/xbee/stop', {method:'POST'});
      toast('XBee désactivé', 'ok');
    }
  }catch(e){ toast('Erreur XBee','err'); }
}
async function xbeeAutoDetect(){
  const btn = document.getElementById('xbeeDetectBtn');
  btn.disabled = true;
  btn.textContent = 'Recherche en cours...';
  try{
    const r = await fetch('/api/xbee/detect', {method:'POST'}).then(r=>r.json());
    if(r.ok){
      document.getElementById('advXbeePort').value = r.port;
      document.getElementById('advXbeeBaud').value = r.baud;
      document.getElementById('xbeeStatus').textContent = `Trouvé : ${r.port} @ ${r.baud}`;
      document.getElementById('xbeeStatus').style.color = 'var(--green)';
      toast(`XBee détecté : ${r.port} @ ${r.baud}`, 'ok');
    } else {
      document.getElementById('xbeeStatus').textContent = r.error || 'Non trouvé';
      document.getElementById('xbeeStatus').style.color = 'var(--red)';
      toast(r.error || 'XBee non trouvé', 'err');
    }
  }catch(e){ toast('Erreur détection','err'); }
  btn.disabled = false;
  btn.textContent = 'Auto-détecter le XBee';
}
async function camTestConnection(){
  const btn = document.getElementById('camTestBtn');
  btn.disabled = true;
  btn.textContent = 'Test...';
  const data = {
    ip:   document.getElementById('cfgIp').value.trim(),
    port: document.getElementById('cfgPort').value.trim() || '554',
    path: document.getElementById('cfgPath').value.trim(),
    user: document.getElementById('cfgUser').value.trim(),
    pass: document.getElementById('cfgPass').value,
  };
  try{
    const r = await fetch('/api/cameras/test', {method:'POST', headers:{'Content-Type':'application/json'}, body:JSON.stringify(data)}).then(r=>r.json());
    if(r.ok){
      toast(`Connexion OK — ${r.width}×${r.height}`, 'ok');
    } else {
      toast(r.error || 'Échec de connexion', 'err');
    }
  }catch(e){ toast('Erreur réseau','err'); }
  btn.disabled = false;
  btn.textContent = 'Tester';
}
let mgCurrentTab = 0;
function mgSetTab(n){
  [0,1,2,3].forEach(i=>{
    document.getElementById('mgTab'+i).classList.toggle('a-draw', i===n);
    document.getElementById('mgP'+i).style.display = i===n ? '' : 'none';
  });
  mgCurrentTab = n;
}
async function openManage(){
  document.getElementById('manageModal').classList.add('on');
  mgSetTab(0);
  await mgRefreshImages();
}
function closeManage(){
  document.getElementById('manageModal').classList.remove('on');
}
async function mgRefreshImages(){
  const imgs = await fetch('/api/images').then(r=>r.json());
  const list = document.getElementById('mgImgList');
  ['mgDupSrc','mgExportSrc'].forEach(id=>{
    const sel = document.getElementById(id);
    sel.innerHTML = '<option value="">— Sélectionner —</option>';
    imgs.forEach(n=>{ const o=document.createElement('option'); o.value=n; o.textContent=n; sel.appendChild(o); });
  });
  if(!imgs.length){ list.innerHTML='<div class="form-hint">Aucune image trouvée.</div>'; return; }
  list.innerHTML = imgs.map(name=>`
    <div style="display:flex;align-items:center;gap:8px;padding:6px 8px;background:var(--bg);border:1px solid var(--border);border-radius:3px">
      <span style="flex:1;font-family:var(--mono);font-size:12px;color:var(--text)">${name}</span>
      <button class="mf-btn" onclick="mgAssign('${name}')"
              style="padding:3px 8px;font-size:11px;border-color:var(--accent);color:var(--accent)">Attribuer</button>
      <button class="mf-btn" onclick="mgRename('${name}')"
              style="padding:3px 8px;font-size:11px">Renommer</button>
      <button class="mf-btn" onclick="mgDelete('${name}')"
              style="padding:3px 8px;font-size:11px;border-color:var(--red);color:var(--red)">Supprimer</button>
    </div>`).join('');
}
async function mgAssign(filename){
  const cams = await fetch('/api/cameras').then(r=>r.json());
  if(!cams.length){ toast('Aucune caméra configurée','err'); return; }
  document.getElementById('assignFilename').textContent = filename;
  document.getElementById('assignCamList').innerHTML = cams.map(c =>
    `<button class="settings-btn" style="width:100%;margin:4px 0;padding:8px 12px;text-align:left;font-size:12px"
       onclick="doAssign('${filename}','${c.id}')">${c.id} — ${c.name}</button>`
  ).join('');
  document.getElementById('assignModal').classList.add('on');
}
async function doAssign(filename, camId){
  document.getElementById('assignModal').classList.remove('on');
  try{
    const r = await fetch('/api/manage/assign', {
      method:'POST', headers:{'Content-Type':'application/json'},
      body: JSON.stringify({filename, cam_id: camId})
    }).then(r=>r.json());
    if(r.ok){
      toast(`${r.old} → ${r.new}`, 'ok');
      await mgRefreshImages();
      await refreshImageList();
    } else {
      toast(r.error || 'Erreur attribution', 'err');
    }
  }catch(e){ toast('Erreur réseau','err'); }
}
let _renameOldName = '';
function mgRename(oldName){
  _renameOldName = oldName;
  const base = oldName.substring(0, oldName.lastIndexOf('.'));
  document.getElementById('renameInput').value = base;
  document.getElementById('renameModal').classList.add('on');
  setTimeout(()=>document.getElementById('renameInput').focus(), 100);
}
async function doRename(){
  const oldName = _renameOldName;
  const ext = oldName.substring(oldName.lastIndexOf('.'));
  const newBase = document.getElementById('renameInput').value.trim();
  if(!newBase){ toast('Entrez un nom','err'); return; }
  const newName = newBase + ext;
  if(newName === oldName){ document.getElementById('renameModal').classList.remove('on'); return; }
  const r = await fetch('/api/manage/rename', {
    method:'POST', headers:{'Content-Type':'application/json'},
    body: JSON.stringify({old: oldName, new: newName})
  }).then(r=>r.json());
  document.getElementById('renameModal').classList.remove('on');
  if(r.ok){
    toast(`Renommé → ${newName}`, 'ok');
    await mgRefreshImages();
    await refreshImageList();
    if(S.imgName === oldName){ document.getElementById('imgSel').value = newName; S.imgName = newName; }
  } else {
    toast(r.error || 'Erreur renommage', 'err');
  }
}
async function mgDelete(name){
  if(!confirm(`Supprimer "${name}" et son masque associé ?`)) return;
  const r = await fetch('/api/manage/delete', {
    method:'POST', headers:{'Content-Type':'application/json'},
    body: JSON.stringify({filename: name})
  }).then(r=>r.json());
  if(r.ok){
    toast(`Supprimé : ${name}`, 'ok');
    await mgRefreshImages();
    await refreshImageList();
  } else {
    toast(r.error || 'Erreur suppression', 'err');
  }
}
async function mgUpload(){
  const input = document.getElementById('mgUploadFile');
  const hint  = document.getElementById('mgUploadHint');
  if(!input.files.length){ toast('Sélectionnez un fichier','err'); return; }
  const fd = new FormData();
  fd.append('file', input.files[0]);
  hint.textContent = 'Envoi en cours...';
  try{
    const r = await fetch('/api/manage/upload', {method:'POST', body: fd}).then(r=>r.json());
    if(r.ok){
      hint.textContent = `✓ ${r.filename} importé avec succès.`;
      toast(`Image importée : ${r.filename}`, 'ok');
      await mgRefreshImages();
      await refreshImageList();
      input.value = '';
    } else {
      hint.textContent = r.error || 'Erreur upload';
      toast(r.error || 'Erreur upload', 'err');
    }
  }catch(e){ hint.textContent='Erreur réseau'; toast('Erreur réseau','err'); }
}
async function mgDuplicateMask(){
  const src = document.getElementById('mgDupSrc').value;
  const w   = parseInt(document.getElementById('mgDupW').value);
  const h   = parseInt(document.getElementById('mgDupH').value);
  if(!src){ toast('Sélectionnez une image source','err'); return; }
  if(!w || !h){ toast('Entrez une résolution cible','err'); return; }
  const r = await fetch('/api/manage/duplicate_mask', {
    method:'POST', headers:{'Content-Type':'application/json'},
    body: JSON.stringify({src_image: src, dst_w: w, dst_h: h, cam_id: S.camId})
  }).then(r=>r.json());
  if(r.ok) toast(`Masque dupliqué → ${r.file} (${r.count} places)`, 'ok');
  else toast(r.error || 'Erreur duplication', 'err');
}
function mgExport(){
  const src = document.getElementById('mgExportSrc').value;
  if(!src){ toast('Sélectionnez une image','err'); return; }
  window.location.href = `/api/manage/export/${encodeURIComponent(src)}?cam_id=${encodeURIComponent(S.camId)}`;
}
let cameras = [];
let camEditingId = null;   // null = ajout, string = édition
let _defaultCamId = '';
async function camLoadAll(){
  try{
    cameras = await fetch('/api/cameras').then(r=>r.json());
    try{
      const st = await fetch('/api/live/stats').then(r=>r.json());
      _defaultCamId = st.engine_cam_id || st.default_camera || '';
    }catch(e){}
    camRefreshSelect();
  }catch(e){ console.error('camLoadAll', e); }
}
function camRefreshSelect(){
  const sel = document.getElementById('camSel');
  const cur = sel.value;
  sel.innerHTML = '';
  if(!cameras.length){
    sel.innerHTML = '<option value="">— Aucune caméra —</option>';
  } else {
    cameras.forEach(c => {
      const o = document.createElement('option');
      o.value = c.id;
      o.textContent = c.name;
      sel.appendChild(o);
    });
    if(cameras.find(c=>c.id===cur)) sel.value = cur;
    else if(_defaultCamId && cameras.find(c=>c.id===_defaultCamId)) sel.value = _defaultCamId;
    else if(cameras.length) sel.value = cameras[0].id;
  }
  camChanged();
}
function camChanged(){
  const sel = document.getElementById('camSel');
  const cam = cameras.find(c=>c.id===sel.value);
  document.getElementById('camEditBtn').disabled = !cam;
  document.getElementById('camDelBtn').disabled  = !cam || cameras.length <= 1;
  if(!liveRunning){
    if(cam){
      document.getElementById('lSrcDisplay').innerHTML = `<span>${cam.name}</span><br>${cam.ip} — ${cam.path}`;
    } else {
      document.getElementById('lSrcDisplay').innerHTML = '<span>—</span><br>Sélectionnez une caméra';
    }
  }
  if(cam){
    fetch('/api/cameras/active_mask?cam_id='+encodeURIComponent(cam.id)).then(r=>r.json()).then(r=>{
      document.getElementById('lActiveMask').textContent = r.active_mask || 'aucun';
    }).catch(()=>{});
  } else {
    document.getElementById('lActiveMask').textContent = '—';
  }
  updateDefaultCamInfo();
}
async function setDefaultCam(){
  const sel = document.getElementById('camSel');
  if(!sel.value){ toast('Sélectionnez une caméra','err'); return; }
  try{
    await fetch('/api/settings', {method:'POST', headers:{'Content-Type':'application/json'}, body:JSON.stringify({default_camera: sel.value})});
    const wasStreaming = liveRunning;
    if(wasStreaming) await fetch('/api/live/stop',{method:'POST'});
    await fetch('/api/live/stop_all',{method:'POST'});
    await fetch('/api/live/start',{method:'POST', headers:{'Content-Type':'application/json'}, body:JSON.stringify({camera_id: sel.value})});
    if(!wasStreaming) await fetch('/api/live/stop',{method:'POST'});
    const cam = cameras.find(c=>c.id===sel.value);
    toast(`Détection relancée sur : ${cam ? cam.name : sel.value}`, 'ok');
    updateDefaultCamInfo();
  }catch(e){ toast('Erreur','err'); }
}
function updateDefaultCamInfo(){
  fetch('/api/live/stats').then(r=>r.json()).then(s=>{
    const el = document.getElementById('defaultCamInfo');
    const defId = s.default_camera;
    const engineId = s.engine_cam_id;
    const defCam = cameras.find(c=>c.id===defId);
    const engCam = cameras.find(c=>c.id===engineId);
    let txt = defCam ? `Par défaut : ${defCam.name}` : 'Aucune caméra par défaut';
    if(engCam) txt += ` — Actuel : ${engCam.name}`;
    el.textContent = txt;
    const btn = document.getElementById('defaultCamBtn');
    const sel = document.getElementById('camSel');
    if(sel.value && sel.value === defId){
      btn.style.background = 'var(--accent)'; btn.style.color = '#000'; btn.style.borderColor = 'var(--accent)';
    } else {
      btn.style.background = ''; btn.style.color = ''; btn.style.borderColor = '';
    }
  }).catch(()=>{});
}
function nextCamId(){
  // Trouve le premier cam1, cam2, cam3... disponible (remplit les trous)
  for(let n=1; n<=99; n++){
    if(!cameras.find(c=>c.id==='cam'+n)) return 'cam'+n;
  }
  return 'cam' + Date.now();
}
function camAdd(){
  camEditingId = null;
  document.getElementById('camModalTitle').textContent = 'Ajouter une caméra';
  document.getElementById('cfgIdGroup').style.display = 'none';
  document.getElementById('cfgName').value = '';
  document.getElementById('cfgIp').value   = '';
  document.getElementById('cfgPort').value = '554';
  document.getElementById('cfgPath').value = 'h264Preview_01_sub';
  document.getElementById('cfgUser').value = 'admin';
  document.getElementById('cfgPass').value = '';
  const usedZones = cameras.map(c=>(c.zone||'').toUpperCase());
  let nextZone = 'A';
  for(let i=0; i<26; i++){ if(!usedZones.includes(String.fromCharCode(65+i))){ nextZone=String.fromCharCode(65+i); break; } }
  document.getElementById('cfgZone').value = nextZone;
  updatePreview();
  document.getElementById('camModal').classList.add('on');
}
function camEdit(){
  const sel = document.getElementById('camSel');
  const cam = cameras.find(c=>c.id===sel.value);
  if(!cam) return;
  camEditingId = cam.id;
  document.getElementById('camModalTitle').textContent = 'Éditer — ' + cam.name;
  document.getElementById('cfgIdGroup').style.display = 'none';
  document.getElementById('cfgName').value = cam.name;
  document.getElementById('cfgIp').value   = cam.ip;
  document.getElementById('cfgPort').value = cam.port;
  document.getElementById('cfgPath').value = cam.path;
  document.getElementById('cfgUser').value = cam.user;
  document.getElementById('cfgPass').value = cam.pass;
  document.getElementById('cfgZone').value = cam.zone || 'A';
  updatePreview();
  document.getElementById('camModal').classList.add('on');
}
async function camDelete(){
  const sel = document.getElementById('camSel');
  const cam = cameras.find(c=>c.id===sel.value);
  if(!cam) return;
  if(!confirm(`Supprimer la caméra "${cam.name}" ?`)) return;
  cameras = cameras.filter(c=>c.id!==cam.id);
  await fetch('/api/cameras/save', {method:'POST', headers:{'Content-Type':'application/json'}, body:JSON.stringify(cameras)});
  toast(`Caméra "${cam.name}" supprimée`, 'ok');
  if(liveRunning) await liveStop();
  camRefreshSelect();
  editorRefreshCams();
}
async function camScan(){
  const btn = document.getElementById('camScanBtn');
  const div = document.getElementById('scanResults');
  btn.disabled = true;
  btn.textContent = 'Scan en cours...';
  div.style.display = 'none';
  try{
    const r = await fetch('/api/cameras/scan', {method:'POST'}).then(r=>r.json());
    if(!r.ok){ toast(r.error || 'Erreur scan', 'err'); return; }
    if(r.devices.length === 0){
      div.innerHTML = '<div class="form-hint" style="color:var(--yellow)">Aucune caméra trouvée sur le réseau</div>';
    } else {
      const existingIps = cameras.map(c=>c.ip);
      div.innerHTML = r.devices.map(d => {
        const already = existingIps.includes(d.ip);
        const label = d.hostname ? `${d.ip}:${d.port} (${d.hostname})` : `${d.ip}:${d.port}`;
        if(already) return `<div class="form-hint" style="margin:3px 0">${label} — déjà ajoutée</div>`;
        return `<button class="settings-btn" style="margin:3px 0;font-size:10px;padding:4px 8px;width:100%;text-align:left"
                  onclick="camAddFromScan('${d.ip}','${d.port}','${d.hostname||''}')">${label}</button>`;
      }).join('');
    }
    div.style.display = 'block';
    toast(`${r.devices.length} appareil(s) trouvé(s)`, 'ok');
  }catch(e){ toast('Erreur réseau','err'); }
  btn.disabled = false;
  btn.textContent = 'Rechercher sur le réseau';
}
function camAddFromScan(ip, port, hostname){
  camEditingId = null;
  document.getElementById('camModalTitle').textContent = 'Ajouter une caméra';
  document.getElementById('cfgName').value = hostname || `Caméra ${ip}`;
  document.getElementById('cfgIp').value = ip;
  document.getElementById('cfgPort').value = port;
  document.getElementById('cfgPath').value = '';
  document.getElementById('cfgUser').value = 'admin';
  document.getElementById('cfgPass').value = '';
  updatePreview();
  document.getElementById('camModal').classList.add('on');
  document.getElementById('scanResults').style.display = 'none';
}
function camCloseModal(){
  document.getElementById('camModal').classList.remove('on');
}
async function camSaveModal(){
  const name = document.getElementById('cfgName').value.trim();
  const ip   = document.getElementById('cfgIp').value.trim();
  const port = document.getElementById('cfgPort').value.trim() || '554';
  const path = document.getElementById('cfgPath').value.trim();
  const user = document.getElementById('cfgUser').value.trim();
  const pass = document.getElementById('cfgPass').value;
  const zone = (document.getElementById('cfgZone').value.trim().toUpperCase() || 'A').charAt(0);
  if(!name){ toast('Entrez un nom de caméra','err'); return; }
  if(!ip){ toast('Entrez une adresse IP','err'); return; }
  const duplicate = cameras.find(c => c.name.toLowerCase() === name.toLowerCase() && c.id !== camEditingId);
  if(duplicate){ toast('Ce nom est déjà utilisé par une autre caméra','err'); return; }

  let finalId;
  if(camEditingId){
    const cam = cameras.find(c=>c.id===camEditingId);
    if(cam){
      cam.name=name; cam.ip=ip; cam.port=port; cam.path=path; cam.user=user; cam.pass=pass; cam.zone=zone;
    }
    finalId = camEditingId;
  } else {
    finalId = nextCamId();
    cameras.push({id: finalId, name, ip, port, path, user, pass, zone});
  }
  await fetch('/api/cameras/save', {method:'POST', headers:{'Content-Type':'application/json'}, body:JSON.stringify(cameras)});
  camCloseModal();
  toast(camEditingId ? 'Caméra modifiée' : 'Caméra ajoutée', 'ok');
  camRefreshSelect();
  editorRefreshCams();
  document.getElementById('camSel').value = finalId;
  camChanged();
  if(liveRunning && camEditingId){
    await liveStop();
    await liveStart();
  }
}
function updatePreview(){
  const cfg = {
    ip:   document.getElementById('cfgIp').value   || '192.168.0.8',
    port: document.getElementById('cfgPort').value  || '554',
    path: document.getElementById('cfgPath').value  || 'h264Preview_01_sub',
    user: document.getElementById('cfgUser').value  || 'admin',
    pass: document.getElementById('cfgPass').value  || '••••••',
  };
  const passDisplay = cfg.pass === '••••••' ? '••••••' : '*'.repeat(cfg.pass.length);
  document.getElementById('urlPreview').innerHTML =
    `rtsp://<span>${cfg.user}</span>:${passDisplay}@<span>${cfg.ip}</span>:${cfg.port}/${cfg.path}`;
}
function switchTab(name){
  document.querySelectorAll('.tab').forEach(t=>t.classList.remove('active'));
  document.querySelectorAll('.tab-panel').forEach(p=>p.classList.remove('active'));
  document.getElementById('tab'+name.charAt(0).toUpperCase()+name.slice(1)).classList.add('active');
  document.getElementById('panel'+name.charAt(0).toUpperCase()+name.slice(1)).classList.add('active');
  if(name==='live'){ resizeLive(); camLoadAll(); loadDetectionSettings(); if(!statsInterval) statsInterval = setInterval(fetchStats, 10000); fetchStats(); }
  if(name==='editor'){ setTimeout(function(){ resize(); if(S.img) resetView(); }, 100); }
  if(name==='demo') demoLoadVideos();
  if(name==='about') loadAboutInfo();
  try{ localStorage.setItem('activeTab', name); }catch(e){}
}
function restoreTab(){
  try{
    const saved = localStorage.getItem('activeTab');
    switchTab(saved || 'editor');
  }catch(e){ switchTab('editor'); }
}
async function loadAboutInfo(){
  try{
    const info = await fetch('/api/about').then(r=>r.json());
    document.getElementById('aboutInfo').innerHTML =
      `Version : <span style="color:var(--accent)">${info.version}</span><br>`+
      `Plateforme : ${info.platform}<br>`+
      `Python : ${info.python}<br>`+
      `Modèle YOLO : ${info.yolo_model || '<span style="color:var(--red)">absent</span>'}<br>`+
      `Caméras : ${info.cameras}<br>`+
      `Masques : ${info.masks}<br>`+
      `Captures : ${info.captures}<br>`+
      `Espace disque : ${info.disk_free_mb > 0 ? info.disk_free_mb + ' Mo' : '—'}`;
  }catch(e){}
}
async function resetSettings(){
  if(!confirm('Réinitialiser tous les paramètres aux valeurs par défaut ?')) return;
  try{
    await fetch('/api/reset/settings', {method:'POST'});
    toast('Paramètres réinitialisés', 'ok');
    loadAboutInfo();
  }catch(e){ toast('Erreur','err'); }
}
async function resetFull(){
  if(!confirm('ATTENTION : Cela va supprimer toutes les captures, masques et paramètres. Continuer ?')) return;
  if(!confirm('Êtes-vous vraiment sûr ? Cette action est irréversible.')) return;
  try{
    await fetch('/api/reset/full', {method:'POST'});
    toast('Réinitialisation complète effectuée', 'ok');
    loadAboutInfo();
    camLoadAll();
  }catch(e){ toast('Erreur','err'); }
}
function toggleAboutSection(id){
  const el = document.getElementById(id);
  const chev = document.getElementById(id+'Chev');
  if(el.style.display==='none'){ el.style.display=''; chev.style.transform=''; }
  else { el.style.display='none'; chev.style.transform='rotate(-90deg)'; }
}
function toggleTheme(){
  const isLight = document.body.classList.toggle('light');
  document.getElementById('themeBtn').textContent = isLight ? 'Mode sombre' : 'Mode clair';
  localStorage.setItem('theme', isLight ? 'light' : 'dark');
}
async function applyTheme(){
  const saved = localStorage.getItem('theme');
  if(saved === 'light'){
    document.body.classList.add('light');
    document.getElementById('themeBtn').textContent = 'Mode sombre';
  }
}
document.addEventListener('keydown',e=>{
  if(e.key==='Escape'){S.curPts=[];S.sepLines=[];S.dragging=false;S.dragStart=null;S.editDrag=null;updateDrawUI();updateSepUI();render();}
  if(e.key==='Enter'&&S.mode==='sep')confirmSep();
  if((e.ctrlKey||e.metaKey)&&e.key==='z'){e.preventDefault();undo();}
  if((e.ctrlKey||e.metaKey)&&e.key==='s'){e.preventDefault();doSave();}
  if(!e.ctrlKey&&!e.metaKey){
    if(e.key==='d')setMode('draw');
    if(e.key==='s')setMode('sep');
    if(e.key==='e')setMode('sel');
    if((e.key==='Delete'||e.key==='Backspace')&&S.mode==='sel'&&S.selZ>=0)delSelected();
  }
});
let liveRunning = false;
let statsInterval = null;
async function liveStart(){
  const camId = document.getElementById('camSel').value;
  if(!camId){ toast('Sélectionnez une caméra','err'); return; }
  const cam = cameras.find(c=>c.id===camId);
  document.getElementById('lStartBtn').disabled = true;
  document.getElementById('lStopBtn').disabled = true;
  clearInterval(statsInterval);
  if(demoRunning){
    demoRunning = false;
    clearInterval(demoStatsInterval);
    const dImg = document.getElementById('demoImg');
    if(dImg){ dImg.onerror=null; dImg.src=''; dImg.style.display='none'; }
    showOverlay('demoOverlay', 'DÉMO INTERROMPUE', 'Flux en direct en cours de démarrage');
    document.getElementById('dStopBtn').disabled = true;
    document.getElementById('dPauseBtn').disabled = true;
    document.getElementById('demoDot').classList.remove('on');
    toast('Démo interrompue pour le flux en direct', '', 6000);
  }
  const img = document.getElementById('liveImg');
  img.src = ''; img.style.display = 'none';
  showOverlayLoading('streamOverlay', 'Connexion au flux...');
  const ov = document.getElementById('streamOverlay');
  try{
    await fetch('/api/live/stop_all', {method:'POST'});
    await new Promise(r => setTimeout(r, 500));
    const resp = await fetch('/api/live/start', {
      method:'POST',
      headers:{'Content-Type':'application/json'},
      body: JSON.stringify({camera_id: camId})
    });
    const data = await resp.json();
    await new Promise(r => setTimeout(r, 3000));
    img.src = '/video_feed?t=' + Date.now();
    img.style.display = 'block';
    img.onload = () => { ov.classList.add('hidden'); };
    img.onerror = (e) => {
      console.error('[live] img error', e);
      ov.innerHTML='<div class="so-title" style="color:var(--red)">Erreur flux</div><div class="so-sub">Vérifiez la connexion RTSP</div>';
    };
    liveRunning = true;
    document.getElementById('lStartBtn').disabled = false;
    document.getElementById('lStopBtn').disabled = false;
    document.getElementById('liveDot').classList.add('on');
    if(cam) document.getElementById('lSrcDisplay').innerHTML = `<span>${cam.name}</span><br>${cam.ip} — En direct`;
    try{
      const mr = await fetch('/api/cameras/active_mask?cam_id='+encodeURIComponent(camId)).then(r=>r.json());
      document.getElementById('lActiveMask').textContent = mr.active_mask || 'aucun';
    }catch(e){}
    statsInterval = setInterval(fetchStats, 2000);
  } catch(e){
    console.error('[live] start error:', e);
    toast('Erreur démarrage flux : ' + e.message, 'err');
    ov.innerHTML='<div class="so-title" style="color:var(--red)">Erreur</div><div class="so-sub">'+e.message+'</div>';
    document.getElementById('lStartBtn').disabled = false;
    document.getElementById('lStopBtn').disabled = false;
  }
}
async function liveStop(){
  await fetch('/api/live/stop',{method:'POST'});
  liveRunning = false;
  clearInterval(statsInterval);
  statsInterval = setInterval(fetchStats, 10000);
  const img = document.getElementById('liveImg');
  img.onerror = null; img.onload = null; // Empêcher le flash "erreur de flux"
  img.src=''; img.style.display='none';
  showOverlay('streamOverlay', 'FLUX VIDÉO ARRÊTÉ', 'Détection en cours en arrière-plan<br>Cliquez Démarrer pour voir le flux');
  document.getElementById('lStartBtn').disabled = false;
  document.getElementById('lStopBtn').disabled = true;
  document.getElementById('liveDot').classList.remove('on');
  camChanged();
  fetchStats(); // Mettre à jour immédiatement
}
async function fetchStats(){
  if(document.hidden) return; // Ne pas interroger si l'onglet n'est pas visible
  try{
    const s = await fetch('/api/live/stats').then(r=>r.json());
    const isDetecting = s.detection_running;
    const isStreaming = s.streaming;
    if(isDetecting && !s.error){
      document.getElementById('lFree').textContent = s.free;
      document.getElementById('lOcc').textContent  = s.occ;
      document.getElementById('lTot').textContent  = s.total;
      const pct = s.total > 0 ? Math.round(s.free / s.total * 100) : 0;
      document.getElementById('lPct').style.width  = pct + '%';
    }
    const yb = document.getElementById('yoloBadge');
    if(!s.yolo_available){ yb.textContent='Non disponible'; yb.style.color='var(--red)'; }
    else if(s.yolo_enabled){ yb.textContent='Activée'; yb.style.color='var(--green)'; }
    else{ yb.textContent='Désactivée'; yb.style.color='var(--text-dim)'; }
    const py = document.getElementById('perfYolo');
    const pf = document.getElementById('perfFrame');
    const pt = document.getElementById('perfTemp');
    const ps = document.getElementById('perfStatus');
    if(s.yolo_ms !== undefined) py.textContent = s.yolo_ms + ' ms';
    if(s.frame_ms !== undefined) pf.textContent = s.frame_ms + ' ms';
    if(s.cpu_temp !== undefined && s.cpu_temp !== null){
      pt.textContent = s.cpu_temp + '°C';
      pt.style.color = s.cpu_temp > 75 ? 'var(--red)' : s.cpu_temp > 60 ? 'var(--yellow)' : 'var(--green)';
    }
    let camAlert = null;
    if(!isDetecting && demoRunning){
      ps.textContent = 'Mode démo'; ps.style.color = 'var(--yellow)';
    } else if(!isDetecting){
      ps.textContent = 'Arrêté'; ps.style.color = 'var(--text-dim)';
    } else if(s.cam_health === 'noir'){
      ps.textContent = 'Image noire'; ps.style.color = 'var(--red)';
      camAlert = 'noir';
    } else if(s.cam_health === 'figé'){
      ps.textContent = 'Image figée'; ps.style.color = 'var(--yellow)';
      camAlert = 'figé';
    } else if(s.error){
      ps.textContent = 'Reconnexion...'; ps.style.color = 'var(--yellow)';
      camAlert = 'error';
    } else if(isStreaming){
      ps.textContent = 'Flux actif'; ps.style.color = 'var(--green)';
    } else {
      ps.textContent = 'Headless'; ps.style.color = 'var(--accent)';
    }
    handleCamAlert(camAlert);
    const dot = document.getElementById('liveDot');
    if(s.error || s.cam_health === 'noir'){
      dot.style.background='var(--red)';
      dot.style.boxShadow='0 0 5px var(--red)';
    } else if(s.cam_health === 'figé'){
      dot.style.background='var(--yellow)';
      dot.style.boxShadow='0 0 5px var(--yellow)';
    } else if(liveRunning){
      dot.style.background=''; dot.style.boxShadow='';
      const sel = document.getElementById('camSel');
      const cam = cameras.find(c=>c.id===sel.value);
      if(cam) document.getElementById('lSrcDisplay').innerHTML = `<span>${cam.name}</span><br>${cam.ip} — En direct`;
    } else if(isDetecting){
      dot.style.background=''; dot.style.boxShadow='';
      const engCam = cameras.find(c=>c.id===s.engine_cam_id);
      if(engCam) document.getElementById('lSrcDisplay').innerHTML = `<span>${engCam.name}</span><br>${engCam.ip} — Arrière-plan`;
    } else if(demoRunning){
      dot.style.background=''; dot.style.boxShadow='';
      document.getElementById('lSrcDisplay').innerHTML = '<span>Mode démo</span><br>Détection en direct en pause';
    }
    if(!liveRunning && demoRunning){
      const ov = document.getElementById('streamOverlay');
      if(!ov.classList.contains('hidden')){
        ov.innerHTML = `<div class="so-title" style="font-size:16px">MODE DÉMO EN COURS</div>
          <div class="so-sub">La détection en direct est en pause<br>Elle reprendra automatiquement à la fin de la démo</div>`;
      }
    } else if(!liveRunning && isDetecting && !s.error){
      const ov = document.getElementById('streamOverlay');
      if(!ov.classList.contains('hidden')){
        const yoloTxt = s.yolo_enabled ? '' : '<div class="so-sub" style="color:var(--yellow)">Détection YOLO désactivée</div>';
        ov.innerHTML = `<div class="so-title" style="font-size:16px">DÉTECTION EN ARRIÈRE-PLAN</div>
          ${yoloTxt}
          <div class="so-sub" style="font-size:22px;margin:12px 0;color:var(--green)">
            ${s.free} libres / ${s.occ} occupées / ${s.total} total
          </div>
          <div class="so-sub">Cliquez Démarrer pour voir le flux vidéo</div>`;
      }
    }
    try{
      const maskRow = document.getElementById('maskToggleRow');
      if(maskRow) maskRow.style.display = (isStreaming && liveRunning) ? '' : 'none';
    }catch(e){}
    const px = document.getElementById('perfXbee');
    if(s.xbee_active){ px.textContent = 'Actif'; px.style.color = 'var(--green)'; }
    else { px.textContent = 'Off'; px.style.color = 'var(--text-dim)'; }
    try{
      const el = document.getElementById('defaultCamInfo');
      if(el){
        const defCam = cameras.find(c=>c.id===s.default_camera);
        const engCam = cameras.find(c=>c.id===s.engine_cam_id);
        let txt = defCam ? `Par défaut : ${defCam.name}` : 'Aucune caméra par défaut';
        if(engCam) txt += ` — Actuel : ${engCam.name}`;
        el.textContent = txt;
      }
    }catch(e){}
  }catch(e){}
}
function resizeLive(){
  const img = document.getElementById('liveImg');
  if(img) img.style.maxHeight = (window.innerHeight - 105) + 'px';
}
let demoRunning = false;
let demoStatsInterval = null;
async function demoLoadVideos(){
  try{
    const data = await fetch('/api/demo/videos').then(r=>r.json());
    const sel = document.getElementById('dVideoSel');
    const cur = sel.value;
    sel.innerHTML = '<option value="">— Sélectionner —</option>';
    data.files.forEach(f=>{
      const o = document.createElement('option');
      o.value = f; o.textContent = f;
      if(f===cur) o.selected = true;
      sel.appendChild(o);
    });
  }catch(e){ console.error('demoLoadVideos', e); }
}
async function demoStart(){
  const video = document.getElementById('dVideoSel').value;
  if(!video){ toast('Sélectionnez une vidéo','err'); return; }
  document.getElementById('dStartBtn').disabled = true;
  showOverlayLoading('demoOverlay', 'Arrêt du live et chargement de la vidéo...');
  const ov = document.getElementById('demoOverlay');
  toast('Détection en direct interrompue pendant la démo', '', 6000);
  if(liveRunning){
    liveRunning = false;
    const lImg = document.getElementById('liveImg');
    lImg.onerror=null; lImg.onload=null; lImg.src=''; lImg.style.display='none';
    document.getElementById('lStartBtn').disabled = false;
    document.getElementById('lStopBtn').disabled = true;
    document.getElementById('liveDot').classList.remove('on');
    showOverlay('streamOverlay', 'FLUX INTERROMPU', 'Mode démo en cours...');
  }
  try{
    const resp = await fetch('/api/demo/start', {
      method:'POST',
      headers:{'Content-Type':'application/json'},
      body: JSON.stringify({video})
    });
    const data = await resp.json();
    if(!data.ok){ toast(data.error || 'Erreur démarrage démo','err'); document.getElementById('dStartBtn').disabled=false; return; }
    await new Promise(r=>setTimeout(r, 800));
    const img = document.getElementById('demoImg');
    img.src = '/demo_feed?t=' + Date.now();
    img.style.display = 'block';
    img.onload = () => ov.classList.add('hidden');
    demoRunning = true;
    document.getElementById('dStartBtn').disabled = false;
    document.getElementById('dStopBtn').disabled  = false;
    document.getElementById('dPauseBtn').disabled = false;
    document.getElementById('demoDot').classList.add('on');
    demoStatsInterval = setInterval(fetchDemoStats, 800);
  }catch(e){
    toast('Erreur: ' + e.message,'err');
    document.getElementById('dStartBtn').disabled = false;
  }
}
async function demoStop(){
  await fetch('/api/demo/stop', {method:'POST'});
  demoRunning = false;
  clearInterval(demoStatsInterval);
  const img = document.getElementById('demoImg');
  img.onerror=null; img.src=''; img.style.display='none';
  showOverlay('demoOverlay', 'DÉMO ARRÊTÉE', 'Détection en direct relancée en arrière-plan');
  document.getElementById('dStartBtn').disabled = false;
  document.getElementById('dStopBtn').disabled  = true;
  document.getElementById('dPauseBtn').disabled = true;
  document.getElementById('dPauseBtn').textContent = 'Pause';
  document.getElementById('demoDot').classList.remove('on');
  document.getElementById('dFree').textContent='—';
  document.getElementById('dOcc').textContent='—';
  document.getElementById('dTot').textContent='—';
  document.getElementById('dPct').style.width='0%';
  document.getElementById('dSeekFill').style.width='0%';
  document.getElementById('dSeekHead').style.left='0%';
  document.getElementById('dFrameInfo').textContent='Frame — / —';
  showOverlay('streamOverlay', 'FLUX VIDÉO ARRÊTÉ', 'Détection en cours en arrière-plan<br>Cliquez Démarrer pour voir le flux');
  toast('Détection en direct relancée', 'ok');
}
async function fetchDemoStats(){
  try{
    const s = await fetch('/api/demo/stats').then(r=>r.json());
    document.getElementById('dFree').textContent = s.free;
    document.getElementById('dOcc').textContent  = s.occ;
    document.getElementById('dTot').textContent  = s.total;
    const pct = s.total>0 ? Math.round(s.free/s.total*100) : 0;
    document.getElementById('dPct').style.width = pct+'%';
    const prog = s.total_frames>0 ? Math.round(s.frame/s.total_frames*100) : 0;
    document.getElementById('dSeekFill').style.width = prog+'%';
    document.getElementById('dSeekHead').style.left  = prog+'%';
    const toTime = f => { const t=Math.round(f/25); return `${String(Math.floor(t/60)).padStart(2,'0')}:${String(t%60).padStart(2,'0')}`; };
    document.getElementById('dFrameInfo').textContent =
      s.total_frames>0 ? `${toTime(s.frame)} / ${toTime(s.total_frames)}  (frame ${s.frame})` : 'Frame — / —';
    const pb = document.getElementById('dPauseBtn');
    pb.textContent = s.paused ? '▶ Reprendre' : 'Pause';
    const yb = document.getElementById('dYoloBadge');
    if(!s.yolo_available){ yb.textContent='Non disponible'; yb.style.color='var(--red)'; }
    else if(s.yolo_enabled){ yb.textContent='Activée'; yb.style.color='var(--green)'; }
    else{ yb.textContent='Désactivée'; yb.style.color='var(--text-dim)'; }
    if(s.finished){ demoStop(); toast('Vidéo terminée','ok'); }
  }catch(e){}
}
async function demoPause(){
  await fetch('/api/demo/pause', {method:'POST'});
}
async function demoSeek(e){
  const bar  = document.getElementById('dSeekBar');
  const rect = bar.getBoundingClientRect();
  const pct  = Math.max(0, Math.min(100, (e.clientX - rect.left) / rect.width * 100));
  document.getElementById('dSeekFill').style.width = pct+'%';
  document.getElementById('dSeekHead').style.left  = pct+'%';
  await fetch('/api/demo/seek', {
    method:'POST',
    headers:{'Content-Type':'application/json'},
    body: JSON.stringify({pct})
  });
}
async function demoToggleYolo(enabled){
  try{
    await fetch('/api/demo/yolo', {method:'POST', headers:{'Content-Type':'application/json'}, body:JSON.stringify({enabled})});
    toast(enabled?'YOLO activé':'YOLO désactivé', enabled?'ok':'');
  }catch(e){ toast('Erreur toggle YOLO','err'); }
}
const COLS=['#00e5ff','#ff6b35','#00ff88','#ffd600','#b84dff','#ff3b5c','#4dffa6','#ff9f0a','#00bfff','#ff69b4'];
const HIT_RADIUS=12;
const canvas=document.getElementById('C'), ctx=canvas.getContext('2d'), cbox=document.getElementById('cbox');
let S={
  img:null, imgName:null, iW:0, iH:0,
  zones:[], selZ:-1, mode:'draw',
  curPts:[], sepLines:[], dragging:false, dragStart:null,
  editDrag:null, hovPt:null,
  sc:1, ox:0, oy:0,
  panning:false, px:0, py:0, pox:0, poy:0,
  mx:0, my:0,
  camId: '',  // caméra sélectionnée dans l'éditeur
};
const c2s=([ix,iy])=>[ix*S.sc+S.ox, iy*S.sc+S.oy];
const s2i=(cx,cy)=>[Math.round((cx-S.ox)/S.sc), Math.round((cy-S.oy)/S.sc)];
async function editorCamChanged(){
  const sel = document.getElementById('editorCamSel');
  S.camId = sel.value;
  await refreshImageList();
}
async function editorRefreshCams(){
  try{
    const cams = await fetch('/api/cameras').then(r=>r.json());
    const sel = document.getElementById('editorCamSel');
    const cur = sel.value;
    sel.innerHTML = '';
    cams.forEach(c => {
      const o = document.createElement('option');
      o.value = c.id; o.textContent = c.name;
      sel.appendChild(o);
    });
    if(cams.find(c=>c.id===cur)) sel.value = cur;
    else if(typeof _defaultCamId !== 'undefined' && _defaultCamId && cams.find(c=>c.id===_defaultCamId)) sel.value = _defaultCamId;
    else if(cams.length) sel.value = cams[0].id;
    S.camId = sel.value;
  }catch(e){ console.error('editorRefreshCams', e); }
}
async function refreshImageList(){
  const imgs = await fetch('/api/images?cam_id='+encodeURIComponent(S.camId)).then(r=>r.json());
  const sel = document.getElementById('imgSel');
  const cur = sel.value;
  sel.innerHTML = '<option value="">— Sélectionner une image —</option>';
  imgs.forEach(n=>{const o=document.createElement('option');o.value=n;o.textContent=n;sel.appendChild(o);});
  // Garder la sélection si l'image existe encore dans la liste
  if(imgs.includes(cur)) sel.value = cur;
  else { sel.value = ''; S.img=null; S.imgName=null; S.zones=[]; S.selZ=-1; render(); updateList(); updateStats(); }
}
async function captureFromCam(){
  if(!S.camId){ toast('Sélectionnez une caméra','err'); return; }
  const btn  = document.getElementById('captureBtn');
  const hint = document.getElementById('captureHint');
  btn.disabled = true;
  btn.textContent = '⏳ Capture en cours...';
  hint.textContent = '';
  try{
    const r = await fetch('/api/capture', {
      method:'POST',
      headers:{'Content-Type':'application/json'},
      body: JSON.stringify({camera_id: S.camId})
    }).then(r=>r.json());
    if(r.ok){
      hint.textContent = `✓ ${r.filename} (${r.width}×${r.height})`;
      hint.style.color = 'var(--green)';
      toast(`Screenshot capturé : ${r.filename}`, 'ok');
      await refreshImageList();
      document.getElementById('imgSel').value = r.filename;
      await loadImg(r.filename);
    } else {
      hint.textContent = r.error || 'Erreur capture';
      hint.style.color = 'var(--red)';
      toast(r.error || 'Erreur capture', 'err');
    }
  }catch(e){
    hint.textContent = 'Erreur réseau';
    hint.style.color = 'var(--red)';
    toast('Erreur réseau','err');
  }
  btn.disabled = false;
  btn.textContent = 'Capturer un screenshot';
}
async function init(){
  await editorRefreshCams();
  await refreshImageList();
  document.getElementById('imgSel').addEventListener('change',()=>loadImg(document.getElementById('imgSel').value));
  resize(); window.addEventListener('resize',()=>{resize();render();resizeLive();});
}
async function loadImg(name){
  if(!name)return;
  showLoad(true);
  try{
    const sz=await fetch(`/api/image_size/${encodeURIComponent(name)}?t=${Date.now()}`).then(r=>r.json());
    S.iW=sz.width; S.iH=sz.height;
    if(S.img){ S.img.src=''; S.img=null; } // Libérer l'ancienne image
    const img=new Image();
    await new Promise((res,rej)=>{
      img.onload=res;
      img.onerror=function(){
        // Retry une fois
        img.onload=res; img.onerror=rej;
        img.src=`/api/image/${encodeURIComponent(name)}?t=${Date.now()+1}`;
      };
      img.src=`/api/image/${encodeURIComponent(name)}?t=${Date.now()}`;
    });
    S.img=img; S.imgName=name;
    S.curPts=[]; S.sepLines=[]; S.selZ=-1; S.editDrag=null; S.hovPt=null;
    const cd=await fetch(`/api/coords/${encodeURIComponent(name)}?cam_id=${encodeURIComponent(S.camId)}`).then(r=>r.json());
    S.zones=(cd.coords||[]).map(z=>{
      if(Array.isArray(z)&&Array.isArray(z[0])) return {pts:z, type:'manual'};
      if(z.pts) return {pts:z.pts, type:z.type||'manual'};
      return {pts:z, type:'manual'};
    });
    try{
      const sf=await fetch('/api/sensor_places?cam_id='+encodeURIComponent(S.camId)+'&image_name='+encodeURIComponent(name)).then(r=>r.json());
      const flags = sf.flags || [];
      S.zones.forEach((z,i)=>{ z.sensor = i < flags.length && flags[i]; });
    }catch(e){}
    document.getElementById('estate').style.display='none';
    document.getElementById('fpill').style.display='flex';
    document.getElementById('fstat').textContent=cd.file;
    document.getElementById('saveBtn').disabled=false;
    resetView(); updateList(); updateStats(); updateSepUI();
    try{ updateHint(); }catch(e){}
    try{ updateActiveMaskUI(); }catch(e){}
    try{
      document.getElementById('srcContent').style.display = 'none';
      document.getElementById('srcChevron').style.transform = 'rotate(-90deg)';
    }catch(e){}
    toast(`${name} (${S.iW}×${S.iH}) — ${S.zones.length} places`,'ok');
  }catch(e){toast('Erreur chargement image','err');console.error(e);}
  showLoad(false);
}
function resize(){if(cbox.clientWidth<10||cbox.clientHeight<10)return;canvas.width=cbox.clientWidth;canvas.height=cbox.clientHeight;render();}
function resetView(){
  if(!S.img)return;
  const m=40;
  S.sc=Math.min((canvas.width-m*2)/S.iW,(canvas.height-m*2)/S.iH,2);
  S.ox=(canvas.width-S.iW*S.sc)/2; S.oy=(canvas.height-S.iH*S.sc)/2;
  updZoom(); render();
}
function findNearestPoint(cx,cy){
  let best=null,bd=HIT_RADIUS;
  S.zones.forEach((z,zi)=>z.pts.forEach(([ix,iy],pi)=>{
    const[sx,sy]=c2s([ix,iy]);
    const d=Math.hypot(cx-sx,cy-sy);
    if(d<bd){bd=d;best={zoneIdx:zi,ptIdx:pi};}
  }));
  return best;
}
function render(){
  ctx.clearRect(0,0,canvas.width,canvas.height);
  if(!S.img)return;
  ctx.save();ctx.translate(S.ox,S.oy);ctx.scale(S.sc,S.sc);ctx.drawImage(S.img,0,0);ctx.restore();
  S.zones.forEach((z,i)=>{
    const pts=z.pts.map(p=>c2s(p));
    const isSensor = z.sensor || false;
    const col=isSensor?'#888':COLS[i%COLS.length],isSel=i===S.selZ;
    ctx.save();
    ctx.beginPath();pts.forEach(([x,y],j)=>j?ctx.lineTo(x,y):ctx.moveTo(x,y));ctx.closePath();
    ctx.fillStyle=isSel?`${col}38`:`${col}18`;ctx.fill();
    ctx.strokeStyle=col;ctx.lineWidth=isSel?2.5:1.5;if(isSensor){ctx.setLineDash([6,4]);}ctx.stroke();ctx.setLineDash([]);
    pts.forEach(([x,y],pi)=>{
      const isHov=S.mode==='sel'&&S.hovPt&&S.hovPt.zoneIdx===i&&S.hovPt.ptIdx===pi;
      const isDrg=S.editDrag&&S.editDrag.zoneIdx===i&&S.editDrag.ptIdx===pi;
      const r=S.mode==='sel'?(isHov||isDrg?9:6):(isSel?5:3.5);
      ctx.beginPath();ctx.arc(x,y,r,0,Math.PI*2);ctx.fillStyle=isDrg?'#fff':col;ctx.fill();
      if(S.mode==='sel'){ctx.strokeStyle='#000';ctx.lineWidth=1.5;ctx.stroke();}
    });
    const cx2=pts.reduce((s,[x])=>s+x,0)/pts.length,cy2=pts.reduce((s,[,y])=>s+y,0)/pts.length;
    const lbl=isSensor?'S':String(i+1);
    ctx.font=`bold ${Math.max(10,12*S.sc)}px 'Share Tech Mono',monospace`;
    ctx.textAlign='center';ctx.textBaseline='middle';
    const tw=ctx.measureText(lbl).width+10;
    ctx.fillStyle=`${col}cc`;ctx.fillRect(cx2-tw/2,cy2-9,tw,18);
    ctx.fillStyle='#000';ctx.fillText(lbl,cx2,cy2);
    ctx.restore();
  });
  if(S.mode==='draw'&&S.curPts.length>0){
    const pts=S.curPts.map(p=>c2s(p));
    const[mx,my]=c2s([S.mx,S.my]);
    ctx.save();
    ctx.strokeStyle='#ff6b35';ctx.lineWidth=1.5;ctx.setLineDash([5,4]);
    ctx.beginPath();ctx.moveTo(pts[0][0],pts[0][1]);pts.slice(1).forEach(([x,y])=>ctx.lineTo(x,y));ctx.stroke();
    ctx.setLineDash([]);ctx.strokeStyle='rgba(255,107,53,.35)';ctx.setLineDash([3,3]);
    ctx.beginPath();ctx.moveTo(pts[pts.length-1][0],pts[pts.length-1][1]);ctx.lineTo(mx,my);ctx.stroke();ctx.setLineDash([]);
    pts.forEach(([x,y],i)=>{ctx.beginPath();ctx.arc(x,y,6,0,Math.PI*2);ctx.fillStyle='#ff6b35';ctx.fill();ctx.fillStyle='#000';ctx.font='bold 10px monospace';ctx.textAlign='center';ctx.textBaseline='middle';ctx.fillText(i+1,x,y);});
    ctx.restore();
  }
  if(S.mode==='sep'){
    ctx.save();
    if(S.sepLines.length>=2){
      const pv=sepToZones(S.sepLines),base=S.zones.length;
      pv.forEach((z,i)=>{
        const col=COLS[(base+i)%COLS.length];
        const pts=z.pts.map(p=>c2s(p));
        ctx.beginPath();pts.forEach(([x,y],j)=>j?ctx.lineTo(x,y):ctx.moveTo(x,y));ctx.closePath();
        ctx.fillStyle=`${col}20`;ctx.fill();
        ctx.strokeStyle=`${col}80`;ctx.lineWidth=1.5;ctx.setLineDash([4,3]);ctx.stroke();ctx.setLineDash([]);
      });
    }
    S.sepLines.forEach((l,i)=>{
      const[ax,ay]=c2s([l.x1,l.y1]),[bx,by]=c2s([l.x2,l.y2]);
      ctx.strokeStyle='#b84dff';ctx.lineWidth=2;
      ctx.beginPath();ctx.moveTo(ax,ay);ctx.lineTo(bx,by);ctx.stroke();
      [[ax,ay],[bx,by]].forEach(([x,y])=>{ctx.beginPath();ctx.arc(x,y,5,0,Math.PI*2);ctx.fillStyle='#b84dff';ctx.fill();});
      const mx2=(ax+bx)/2,my2=(ay+by)/2;
      ctx.font='bold 11px monospace';ctx.textAlign='center';ctx.textBaseline='middle';
      ctx.fillStyle='rgba(0,0,0,.7)';ctx.fillRect(mx2-8,my2-8,16,16);
      ctx.fillStyle='#b84dff';ctx.fillText(i+1,mx2,my2);
    });
    if(S.dragging&&S.dragStart){
      const[ax,ay]=c2s([S.dragStart.x,S.dragStart.y]),[bx,by]=c2s([S.mx,S.my]);
      ctx.strokeStyle='rgba(184,77,255,.7)';ctx.lineWidth=2;ctx.setLineDash([6,3]);
      ctx.beginPath();ctx.moveTo(ax,ay);ctx.lineTo(bx,by);ctx.stroke();ctx.setLineDash([]);
      ctx.beginPath();ctx.arc(ax,ay,5,0,Math.PI*2);ctx.fillStyle='rgba(184,77,255,.8)';ctx.fill();
    }
    ctx.restore();
  }
}
function sepToZones(lines){
  return lines.slice(0,-1).map((_,i)=>{
    const a=lines[i],b=lines[i+1];
    return{pts:[[a.x1,a.y1],[b.x1,b.y1],[b.x2,b.y2],[a.x2,a.y2]],type:'sep'};
  });
}
cbox.addEventListener('mousedown',e=>{
  if(_edTouch.active) return; // Bloquer les événements mouse émulés après touch
  if(e.button===1||(e.button===0&&e.altKey)){S.panning=true;S.px=e.clientX;S.py=e.clientY;S.pox=S.ox;S.poy=S.oy;cbox.classList.add('pan');return;}
  const r=cbox.getBoundingClientRect(),cx=e.clientX-r.left,cy=e.clientY-r.top;
  const[ix,iy]=s2i(cx,cy);
  if(e.button===2){
    e.preventDefault();
    if(S.mode==='draw'){S.curPts=[];updateDrawUI();render();}
    else if(S.mode==='sep'){if(S.sepLines.length>0)S.sepLines.pop();S.dragging=false;S.dragStart=null;updateSepUI();render();}
    return;
  }
  if(e.button!==0||!S.img)return;
  if(ix<0||iy<0||ix>S.iW||iy>S.iH)return;
  if(S.mode==='draw'){
    S.curPts.push([ix,iy]);
    if(S.curPts.length===4){S.zones.push({pts:[...S.curPts],type:'manual'});S.curPts=[];updateList();updateStats();}
    updateDrawUI();render();
  }else if(S.mode==='sep'){
    S.dragging=true;S.dragStart={x:ix,y:iy};
  }else if(S.mode==='sel'){
    const hit=findNearestPoint(cx,cy);
    if(hit){S.editDrag=hit;S.selZ=hit.zoneIdx;cbox.classList.add('dragging-pt');updateEditUI();updateList();render();}
    else{let f=-1;for(let i=S.zones.length-1;i>=0;i--)if(ptInPoly([ix,iy],S.zones[i].pts)){f=i;break;}S.selZ=f;S.editDrag=null;updateEditUI();updateList();render();}
  }
});
cbox.addEventListener('mousemove',e=>{
  const r=cbox.getBoundingClientRect(),cx=e.clientX-r.left,cy=e.clientY-r.top;
  if(S.panning){S.ox=S.pox+(e.clientX-S.px);S.oy=S.poy+(e.clientY-S.py);render();return;}
  const[ix,iy]=s2i(cx,cy);S.mx=ix;S.my=iy;
  if(S.mode==='sel'){
    if(S.editDrag){const c=[Math.max(0,Math.min(S.iW,ix)),Math.max(0,Math.min(S.iH,iy))];S.zones[S.editDrag.zoneIdx].pts[S.editDrag.ptIdx]=c;render();return;}
    const hov=findNearestPoint(cx,cy);
    if(JSON.stringify(hov)!==JSON.stringify(S.hovPt)){S.hovPt=hov;cbox.style.cursor=hov?'grab':'default';render();}
    return;
  }
  if(S.curPts.length>0||S.mode==='sep')render();
});
cbox.addEventListener('mouseup',e=>{
  if(S.panning){S.panning=false;cbox.classList.remove('pan');return;}
  if(S.mode==='sep'&&S.dragging&&S.dragStart){
    const r=cbox.getBoundingClientRect(),[ix,iy]=s2i(e.clientX-r.left,e.clientY-r.top);
    if(Math.hypot(ix-S.dragStart.x,iy-S.dragStart.y)>5)S.sepLines.push({x1:S.dragStart.x,y1:S.dragStart.y,x2:ix,y2:iy});
    S.dragging=false;S.dragStart=null;updateSepUI();render();
  }
  if(S.mode==='sel'&&S.editDrag){S.editDrag=null;cbox.classList.remove('dragging-pt');updateList();render();}
});
cbox.addEventListener('contextmenu',e=>e.preventDefault());
cbox.addEventListener('wheel',e=>{
  e.preventDefault();
  const r=cbox.getBoundingClientRect(),mx=e.clientX-r.left,my=e.clientY-r.top;
  const d=e.deltaY>0?-.15:.15,ns=Math.max(.1,Math.min(8,S.sc+d));
  S.ox=mx-(mx-S.ox)*(ns/S.sc);S.oy=my-(my-S.oy)*(ns/S.sc);S.sc=ns;
  updZoom();render();
},{passive:false});
let _edTouch = {
  pinching: false, dist: 0, sc: 1, ox: 0, oy: 0,
  cx: 0, cy: 0,
  startT: null,
  moved: false,
  startTime: 0,
  active: false,  // true = touch en cours, bloque les événements mouse émulés
};
cbox.addEventListener('touchstart', e=>{
  _edTouch.active = true;
  if(e.touches.length === 2){
    e.preventDefault();
    _edTouch.startT = null;
    const dx = e.touches[0].clientX - e.touches[1].clientX;
    const dy = e.touches[0].clientY - e.touches[1].clientY;
    const r = cbox.getBoundingClientRect();
    _edTouch.pinching = true;
    _edTouch.dist = Math.sqrt(dx*dx+dy*dy);
    _edTouch.sc = S.sc;
    _edTouch.ox = S.ox; _edTouch.oy = S.oy;
    _edTouch.cx = (e.touches[0].clientX + e.touches[1].clientX) / 2 - r.left;
    _edTouch.cy = (e.touches[0].clientY + e.touches[1].clientY) / 2 - r.top;
    _edTouch.moved = true;
    return;
  }
  if(e.touches.length !== 1) return;
  const t = e.touches[0];
  _edTouch.startT = {x: t.clientX, y: t.clientY, ox: S.ox, oy: S.oy};
  _edTouch.moved = false;
  _edTouch.startTime = Date.now();
  if(S.mode === 'sel'){
    const r = cbox.getBoundingClientRect();
    const cx = t.clientX - r.left, cy = t.clientY - r.top;
    const hit = findNearestPoint(cx, cy);
    if(hit){
      e.preventDefault();
      S.editDrag = hit; S.selZ = hit.zoneIdx;
      _edTouch.moved = true;
      updateEditUI(); updateList(); render();
    }
  }
  if(S.mode === 'sep' && S.img){
    const r = cbox.getBoundingClientRect();
    const [ix, iy] = s2i(t.clientX - r.left, t.clientY - r.top);
    _edTouch.sepStart = {x: ix, y: iy};
  }
}, {passive:false});
cbox.addEventListener('touchmove', e=>{
  if(_edTouch.pinching && e.touches.length === 2){
    e.preventDefault();
    const dx = e.touches[0].clientX - e.touches[1].clientX;
    const dy = e.touches[0].clientY - e.touches[1].clientY;
    const dist = Math.sqrt(dx*dx+dy*dy);
    const ns = Math.max(0.2, Math.min(8, _edTouch.sc * (dist / _edTouch.dist)));
    const mx = _edTouch.cx, my = _edTouch.cy;
    S.ox = mx - (mx - _edTouch.ox) * (ns / _edTouch.sc);
    S.oy = my - (my - _edTouch.oy) * (ns / _edTouch.sc);
    S.sc = ns;
    updZoom(); render();
    return;
  }
  if(e.touches.length !== 1 || !_edTouch.startT) return;
  const t = e.touches[0];
  const dx = t.clientX - _edTouch.startT.x;
  const dy = t.clientY - _edTouch.startT.y;
  if(!_edTouch.moved && Math.abs(dx) + Math.abs(dy) > 12){
    _edTouch.moved = true;
  }
  if(!_edTouch.moved) return;
  e.preventDefault();
  if(S.mode === 'sel' && S.editDrag){
    const r = cbox.getBoundingClientRect();
    const [ix, iy] = s2i(t.clientX - r.left, t.clientY - r.top);
    const c = [Math.max(0, Math.min(S.iW, ix)), Math.max(0, Math.min(S.iH, iy))];
    S.zones[S.editDrag.zoneIdx].pts[S.editDrag.ptIdx] = c;
    render();
    return;
  }
  if(S.mode === 'sep' && _edTouch.sepStart){
    const r = cbox.getBoundingClientRect();
    const [ix, iy] = s2i(t.clientX - r.left, t.clientY - r.top);
    S.mx = ix; S.my = iy;
    S.dragging = true; S.dragStart = _edTouch.sepStart;
    render();
    return;
  }
  S.ox = _edTouch.startT.ox + dx;
  S.oy = _edTouch.startT.oy + dy;
  render();
}, {passive:false});
cbox.addEventListener('touchend', e=>{
  if(e.touches.length < 2) _edTouch.pinching = false;
  if(e.touches.length > 0) return;
  if(S.editDrag){ S.editDrag = null; updateList(); render(); }
  if(S.mode === 'sep' && _edTouch.moved && _edTouch.sepStart && S.dragStart){
    if(_edTouch.startT){
      if(Math.hypot(S.mx - _edTouch.sepStart.x, S.my - _edTouch.sepStart.y) > 5){
        S.sepLines.push({x1: _edTouch.sepStart.x, y1: _edTouch.sepStart.y, x2: S.mx, y2: S.my});
      }
    }
    S.dragging = false; S.dragStart = null;
    _edTouch.sepStart = null;
    updateSepUI(); render();
  }
  const now = Date.now();
  if(!_edTouch.moved && now - _edTouch.startTime < 300 && _edTouch.startT){
    if(now - (_edTouch.lastTapTime || 0) < 250){
    } else {
      _edTouch.lastTapTime = now;
      const r = cbox.getBoundingClientRect();
      const cx = _edTouch.startT.x - r.left, cy = _edTouch.startT.y - r.top;
      const [ix, iy] = s2i(cx, cy);
      if(S.mode === 'draw' && S.img && ix >= 0 && iy >= 0 && ix <= S.iW && iy <= S.iH){
        S.curPts.push([ix, iy]);
        if(S.curPts.length === 4){ S.zones.push({pts:[...S.curPts], type:'manual'}); S.curPts = []; updateList(); updateStats(); }
        updateDrawUI(); render();
      } else if(S.mode === 'sel'){
        let f = -1;
        for(let i = S.zones.length-1; i >= 0; i--){
          if(ptInPoly([ix,iy], S.zones[i].pts)){ f = i; break; }
        }
        S.selZ = f; S.editDrag = null;
        updateEditUI(); updateList(); render();
      }
    }
  }
  _edTouch.startT = null;
  _edTouch.sepStart = null;
  setTimeout(()=>{ _edTouch.active = false; }, 400);
});
function confirmSep(){
  if(S.sepLines.length<2)return;
  const zones=sepToZones(S.sepLines);
  S.zones.push(...zones);S.sepLines=[];
  toast(`${zones.length} place(s) générée(s)`,'ok');
  updateList();updateStats();updateSepUI();render();
}
function toggleSrcSection(){
  const content = document.getElementById('srcContent');
  const chevron = document.getElementById('srcChevron');
  if(content.style.display === 'none'){
    content.style.display = '';
    chevron.style.transform = '';
  } else {
    content.style.display = 'none';
    chevron.style.transform = 'rotate(-90deg)';
  }
}
function toggleAdvSection(id){
  const content = document.getElementById(id);
  const chevron = document.getElementById(id + 'Chev');
  if(content.style.display === 'none'){
    content.style.display = '';
    chevron.style.transform = '';
  } else {
    content.style.display = 'none';
    chevron.style.transform = 'rotate(-90deg)';
  }
}
function toggleLiveSection(id){
  const content = document.getElementById(id);
  const chevron = document.getElementById(id + 'Chev');
  if(content.style.display === 'none'){
    content.style.display = '';
    chevron.style.transform = '';
  } else {
    content.style.display = 'none';
    chevron.style.transform = 'rotate(-90deg)';
  }
}
function setMode(m){
  S.mode=m;S.curPts=[];S.sepLines=[];S.dragging=false;S.dragStart=null;S.editDrag=null;S.hovPt=null;
  cbox.classList.remove('editing','dragging-pt');cbox.style.cursor='crosshair';
  if(m==='sel')cbox.classList.add('editing');
  ['Draw','Sep','Sel'].forEach(x=>document.getElementById('t'+x).className='mtab');
  ['pDraw','pSep','pSel'].forEach(id=>document.getElementById(id).classList.remove('on'));
  const b=document.getElementById('mbadge');
  if(m==='draw'){document.getElementById('tDraw').classList.add('a-draw');document.getElementById('pDraw').classList.add('on');b.className='mbadge draw';b.textContent='MODE: MANUEL';}
  else if(m==='sep'){document.getElementById('tSep').classList.add('a-sep');document.getElementById('pSep').classList.add('on');b.className='mbadge sep';b.textContent='MODE: SÉPARATEURS';}
  else{document.getElementById('tSel').classList.add('a-sel');document.getElementById('pSel').classList.add('on');b.className='mbadge sel';b.textContent='MODE: ÉDITER';}
  updateDrawUI();updateSepUI();updateEditUI();updateHint();render();
}
function undo(){
  if(S.curPts.length>0){S.curPts.pop();updateDrawUI();render();return;}
  if(S.sepLines.length>0){S.sepLines.pop();updateSepUI();render();return;}
  if(S.zones.length>0){S.zones.pop();if(S.selZ>=S.zones.length)S.selZ=-1;updateList();updateStats();updateEditUI();render();}
}
function delSelected(){if(S.selZ<0)return;S.zones.splice(S.selZ,1);S.selZ=-1;updateList();updateStats();updateEditUI();render();}
function toggleSensorSelected(){
  if(S.selZ<0)return;
  S.zones[S.selZ].sensor = !S.zones[S.selZ].sensor;
  updateEditUI();updateList();render();
}
function delZone(i){S.zones.splice(i,1);if(S.selZ===i)S.selZ=-1;else if(S.selZ>i)S.selZ--;updateList();updateStats();updateEditUI();render();}
function selZone(i){S.selZ=i===S.selZ?-1:i;updateEditUI();updateList();render();}
function zoom(d){S.sc=Math.max(.1,Math.min(8,S.sc+d));updZoom();render();}
async function doSave(){
  if(!S.imgName)return;
  const btn=document.getElementById('saveBtn');
  btn.disabled=true;btn.textContent='Sauvegarde en cours...';
  try{
    const data=await fetch(`/api/coords/${encodeURIComponent(S.imgName)}`,{
      method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify({coords:S.zones.map(z=>({pts:z.pts, type:z.type||'manual'})), cam_id:S.camId})
    }).then(r=>r.json());
    if(data.success){
      const flags = S.zones.map(z => z.sensor || false);
      await fetch('/api/sensor_places', {method:'POST', headers:{'Content-Type':'application/json'}, body:JSON.stringify({cam_id: S.camId, flags, image_name: S.imgName})});
      btn.textContent='Sauvegarde OK';btn.classList.add('ok');
      toast(`${data.count} places sauvegardées → ${data.file}`,'ok');
      setTimeout(()=>{btn.classList.remove('ok');btn.textContent='Sauvegarder sur le RPI';btn.disabled=false;},2000);
    }
  }catch(e){toast('Erreur sauvegarde','err');btn.textContent='Sauvegarder sur le RPI';btn.disabled=false;}
}
async function setActiveMask(){
  if(!S.imgName || !S.camId) return;
  try{
    await fetch('/api/cameras/active_mask', {method:'POST', headers:{'Content-Type':'application/json'}, body:JSON.stringify({cam_id: S.camId, image_name: S.imgName})});
    toast(`Masque actif : ${S.imgName}`, 'ok');
    updateActiveMaskUI();
  }catch(e){ toast('Erreur','err'); }
}
async function updateActiveMaskUI(){
  const btn = document.getElementById('activeMaskBtn');
  if(!S.camId){ btn.disabled=true; return; }
  btn.disabled = !S.imgName;
  try{
    const r = await fetch('/api/cameras/active_mask?cam_id='+encodeURIComponent(S.camId)).then(r=>r.json());
    if(r.active_mask === S.imgName){
      btn.style.background='var(--accent)'; btn.style.color='#000'; btn.style.borderColor='var(--accent)';
    } else {
      btn.style.background='var(--bg)'; btn.style.color='var(--text-dim)'; btn.style.borderColor='var(--border)';
    }
  }catch(e){}
}
function updateList(){
  const el=document.getElementById('zlist');
  document.getElementById('zcnt').textContent=S.zones.length;
  if(!S.zones.length){el.innerHTML='<div class="zempty">Aucune place définie.<br>Choisissez un mode et tracez.</div>';return;}
  el.innerHTML=S.zones.map((z,i)=>{
    const col=z.sensor?'#888':COLS[i%COLS.length];
    const coord=z.pts.map(([x,y])=>`${x},${y}`).join(' | ');
    const tag=z.sensor?`<span class="ztag" style="background:#666;color:#ddd">CAP</span>`:'';
    return `<div class="zitem ${i===S.selZ?'sel':''}" onclick="selZone(${i})">
      <div class="znum" style="color:${col}">#${String(i+1).padStart(2,'0')}</div>
      ${tag}<div class="zcoords">${coord}</div>
      <button class="zdel" onclick="event.stopPropagation();delZone(${i})">×</button>
    </div>`;
  }).join('');
}
function updateStats(){
  const m=S.zones.filter(z=>z.type==='manual').length,s=S.zones.filter(z=>z.type==='sep').length;
  document.getElementById('stZ').textContent=S.zones.length;
  document.getElementById('stM').textContent=m;
  document.getElementById('stS').textContent=s;
}
function updateDrawUI(){
  for(let i=0;i<4;i++)document.getElementById(`p${i}`).classList.toggle('on',i<S.curPts.length);
  const n=S.curPts.length;
  document.getElementById('phint').textContent=n===0?'cliquer 4 coins':n<4?`encore ${4-n} point(s)`:'';
}
function updateSepUI(){
  const n=S.sepLines.length;
  document.getElementById('sepStat').textContent=`${n} séparateur(s)${n>=2?' → '+(n-1)+' place(s)':''}`;
  document.getElementById('sepConfirm').disabled=n<2;
  document.getElementById('sepPrev').innerHTML=Array.from({length:n},()=>`<div class="sep-line-dot"></div>`).join('');
}
function updateEditUI(){
  const info=document.getElementById('editSelInfo'),btn=document.getElementById('delSelBtn'),sbtn=document.getElementById('sensorSelBtn');
  if(S.selZ<0){
    info.textContent='Aucune place sélectionnée';
    btn.disabled=true;
    sbtn.disabled=true;
    sbtn.style.background='';
  } else {
    const isSensor = S.zones[S.selZ].sensor || false;
    info.textContent=`Place #${S.selZ+1}${isSensor?' (capteur)':''} — glisser les coins`;
    btn.disabled=false;
    sbtn.disabled=false;
    sbtn.style.background=isSensor?'var(--accent)':'';
    sbtn.style.color=isSensor?'#000':'';
  }
}
function updateHint(){
  const el=document.getElementById('htxt');
  if(!S.img){el.innerHTML='<span>←</span> Sélectionner une image pour commencer';return;}
  if(S.mode==='draw')el.innerHTML='Cliquer <span>4 coins</span> • Clic droit: annuler tout';
  else if(S.mode==='sep')el.innerHTML='<span>Drag</span>: tracer séparateur • <span>Clic droit</span>: annuler le dernier • <span>Entrée</span>: générer';
  else el.innerHTML='Cliquer pour <span>sélectionner</span> • <span>Glisser un coin</span>: repositionner';
}
