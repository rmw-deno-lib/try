import {mcron} from './index.js'


do =>
  mcron 1,=>
    console.log new Date().toLocaleString()

