
svd = require('node-svd').svd
chai = require('chai')
chai.should()
FrequentDirection = require('../src/fd.coffee')

describe 'frequent direction', () ->
  it 'calc', () ->
    N = 1000
    D = 50
    A = []
    for i in [0...N]
      A.push []
      for j in [0...D] then A[A.length-1].push Math.random()
    
    L = 2*D-1
    B = FrequentDirection.sketch(A,L)
