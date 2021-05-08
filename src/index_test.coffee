import _try from './index.js'

test = (a, b, c)=>
  console.log "args", a, b ,c
  throw new Error('error')

_try test, 1, 2, 3
