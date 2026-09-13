// Local preview server with byte-range support for the KRL introduction.
const http = require('node:http');
const fs = require('node:fs');
const path = require('node:path');
const root = path.resolve(__dirname, 'pravasi-krishi-bandhu');
const types = {'.html':'text/html; charset=utf-8','.css':'text/css; charset=utf-8','.js':'text/javascript; charset=utf-8','.png':'image/png','.jpg':'image/jpeg','.svg':'image/svg+xml','.mp4':'video/mp4'};
const server = http.createServer((req,res) => {
  if (!['GET','HEAD'].includes(req.method)) { res.writeHead(405,{Allow:'GET, HEAD'}); return res.end(); }
  let filename;
  try {
    let relative = decodeURIComponent(new URL(req.url, 'http://localhost').pathname).replace(/^[/\\\\]+/, '');
    filename = path.resolve(root, relative || 'index.html');
    const within = path.relative(root, filename);
    if (within.startsWith('..') || path.isAbsolute(within)) { res.writeHead(403); return res.end(); }
  } catch { res.writeHead(400); return res.end(); }
  fs.stat(filename, (err,stat) => {
    if (err || !stat.isFile()) { res.writeHead(404); return res.end('Not found'); }
    const headers = {'Content-Type':types[path.extname(filename)] || 'application/octet-stream','Accept-Ranges':'bytes','Cache-Control':'no-cache'};
    let start=0,end=stat.size-1,status=200;
    if (req.headers.range) {
      const match = /^bytes=([0-9]*)-([0-9]*)$/.exec(req.headers.range);
      if (!match || (!match[1] && !match[2])) { res.writeHead(416,{'Content-Range':'bytes */'+stat.size}); return res.end(); }
      if (!match[1]) start=Math.max(0,stat.size-Number(match[2]));
      else {start=Number(match[1]);end=match[2]?Math.min(Number(match[2]),end):end;}
      if (start>end || start>=stat.size || !Number.isSafeInteger(start) || !Number.isSafeInteger(end)) { res.writeHead(416,{'Content-Range':'bytes */'+stat.size}); return res.end(); }
      status=206;headers['Content-Range']='bytes '+start+'-'+end+'/'+stat.size;
    }
    headers['Content-Length']=end-start+1;res.writeHead(status,headers);
    if (req.method==='HEAD') return res.end();
    const stream=fs.createReadStream(filename,{start,end});
    stream.on('error',()=>res.destroy());
    res.on('close',()=>stream.destroy());
    stream.pipe(res);
  });
});
server.listen(8000,'127.0.0.1',()=>console.log('Site running at http://127.0.0.1:8000/'));
