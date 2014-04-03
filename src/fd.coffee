svd = require('node-svd').svd

class FrequentDirection
  @sketch: (A,L) ->
    B = []
    idxOfZero = []
    for i in [0...L]
      B.push []
      idxOfZero.push i
      for j in [0...A[0].length] then B[B.length-1].push 0
                            
    for i in [0...A.length]
      idx = idxOfZero.pop()
      for j in [0...A[i].length]
        B[idx][j] = A[i][j]
      if idxOfZero.length is 0
        res = svd(B,L,{U:true, V:false, debug:0})
        sqSigma = Math.pow(res.S[Math.floor(L/2)],2)
        sigmaTilda = []
        for j in [0...res.S.length]
          sq = Math.pow(res.S[j],2)
          sigmaTilda.push Math.sqrt(Math.max(sq-sqSigma,0))
        for j in [0...sigmaTilda.length]
          if sigmaTilda[j] is 0
            idxOfZero.push j
          for k in [0...res.V[j].length]
            B[j][k] = sigmaTilda[j]*res.V[j][k]
    return B

module.exports = FrequentDirection
