var rds = require('../repeated_dna_sequences')
 findRepeatedDnaSequences = rds.findRepeatedDnaSequences
 hash_function = rds.hash_function

exports['test1'] = function (test) {
  var sequences = "AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"
  test.deepEqual (findRepeatedDnaSequences (sequences), ["AAAAACCCCC", "CCCCCAAAAA"])
  test.done ()
}

exports['test2'] = function (test) {
  var str = "AAAAACCCCC"
  test.equal (hash_function (str), 349184)
  test.done ()
}
