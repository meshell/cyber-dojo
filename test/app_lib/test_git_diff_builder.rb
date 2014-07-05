  test 'build chunk with space in its filename' do

    lines =
    [
      'diff --git a/sandbox/file with_space b/sandbox/file with_space',
      'new file mode 100644',
      'index 0000000..21984c7',
      '--- /dev/null',
      '+++ b/sandbox/file with_space',
      '@@ -0,0 +1 @@',
      '+Please rename me!',
      '\\ No newline at end of file'
    ].join("\n")
            'diff --git a/sandbox/file with_space b/sandbox/file with_space',
            'new file mode 100644',
            'index 0000000..21984c7',
                  :added_lines   => [ 'Please rename me!' ],
    source_lines =
    [
      'Please rename me!'
    ].join("\n")
      section(0),
      added_line('Please rename me!', 1),
  test 'build chunk with defaulted now line info' do
    lines =
    [
      'diff --git a/sandbox/untitled_5G3 b/sandbox/untitled_5G3',
      'index e69de29..2e65efe 100644',
      '--- a/sandbox/untitled_5G3',
      '+++ b/sandbox/untitled_5G3',
      '@@ -0,0 +1 @@',
      '+aaa',
      '\\ No newline at end of file'
    ].join("\n")

    # http://www.artima.com/weblogs/viewpost.jsp?thread=164293
    # Is a blog entry by Guido van Rossum.
    # He says that in L,S the ,S can be omitted if the chunk size
    # S is 1. So -3 is the same as -3,1
            'diff --git a/sandbox/untitled_5G3 b/sandbox/untitled_5G3',
            'index e69de29..2e65efe 100644'
                  :added_lines   => [ 'aaa' ],
    source_lines =
    [
      'aaa'
    ].join("\n")
      section(0),
      added_line('aaa', 1),
  test 'build two chunks with leading and trailing same lines ' +
       'and no newline at eof' do

    diff_lines =
    [
      'diff --git a/sandbox/lines b/sandbox/lines',
      'index b1a30d9..7fa9727 100644',
      '--- a/sandbox/lines',
      '+++ b/sandbox/lines',
      '@@ -1,5 +1,5 @@',
      ' 1',
      '-2',
      '+2a',
      ' 3',
      ' 4',
      ' 5',
      '@@ -8,6 +8,6 @@',
      ' 8',
      ' 9',
      ' 10',
      '-11',
      '+11a',
      ' 12',
      ' 13',
      '\\ No newline at end of file'
    ].join("\n")
            'diff --git a/sandbox/lines b/sandbox/lines',
            'index b1a30d9..7fa9727 100644'
              :before_lines => [ '1' ],
                  :deleted_lines => [ '2' ],
                  :added_lines   => [ '2a' ],
                  :after_lines => [ '3', '4', '5' ]
              :before_lines => [ '8', '9', '10' ],
                  :deleted_lines => [ '11' ],
                  :added_lines   => [ '11a' ],
                  :after_lines => [ '12', '13' ]
    source_lines =
    [
      '1',
      '2a',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10',
      '11a',
      '12',
      '13'
    ].join("\n")
      same_line('1', 1),
      section(0),
      deleted_line('2', 2),
      added_line('2a', 2),
      same_line('3', 3),
      same_line('4', 4),
      same_line('5', 5),
      same_line('6', 6),
      same_line('7', 7),
      same_line('8', 8),
      same_line('9', 9),
      same_line('10', 10),
      section(1),
      deleted_line('11', 11),
      added_line('11a', 11),
      same_line('12', 12),
      same_line('13', 13)
  test 'build two chunks first and last lines change ' +
       'and are 7 lines apart' do
    diff_lines =
    [
      'diff --git a/sandbox/lines b/sandbox/lines',
      'index 0719398..2943489 100644',
      '--- a/sandbox/lines',
      '+++ b/sandbox/lines',
      '@@ -1,4 +1,4 @@',
      '-1',
      '+1a',
      ' 2',
      ' 3',
      ' 4',
      '@@ -6,4 +6,4 @@',
      ' 6',
      ' 7',
      ' 8',
      '-9',
      '+9a'
    ].join("\n")
            'diff --git a/sandbox/lines b/sandbox/lines',
            'index 0719398..2943489 100644'
                  :deleted_lines => [ '1' ],
                  :added_lines   => [ '1a' ],
                  :after_lines => [ '2', '3', '4' ]
              :before_lines => [ '6', '7', '8' ],
                  :deleted_lines => [ '9' ],
                  :added_lines   => [ '9a' ],
    source_lines =
    [
      '1a',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9a'
    ].join("\n")
      section(0),
      deleted_line('1', 1),
      added_line('1a', 1),
      same_line('2', 2),
      same_line('3', 3),
      same_line('4', 4),
      same_line('5', 5),
      same_line('6', 6),
      same_line('7', 7),
      same_line('8', 8),
      section(1),
      deleted_line('9', 9),
      added_line('9a', 9)
  test 'build one chunk with two sections ' +
       'each with one line added and one line deleted' do

    diff_lines =
    [
      'diff --git a/sandbox/lines b/sandbox/lines',
      'index 535d2b0..a173ef1 100644',
      '--- a/sandbox/lines',
      '+++ b/sandbox/lines',
      '@@ -1,8 +1,8 @@',
      ' 1',
      ' 2',
      '-3',
      '+3a',
      ' 4',
      '-5',
      '+5a',
      ' 6',
      ' 7',
      ' 8'
    ].join("\n")
            'diff --git a/sandbox/lines b/sandbox/lines',
            'index 535d2b0..a173ef1 100644'
              :before_lines => [ '1', '2' ],
                  :deleted_lines => [ '3' ],
                  :added_lines   => [ '3a' ],
                  :after_lines => [ '4' ]
                  :deleted_lines => [ '5' ],
                  :added_lines   => [ '5a' ],
                  :after_lines => [ '6', '7', '8' ]
    source_lines =
    [
      '1',
      '2',
      '3a',
      '4',
      '5a',
      '6',
      '7',
      '8'
    ].join("\n")
      same_line('1', 1),
      same_line('2', 2),
      section(0),
      deleted_line('3', 3),
      added_line('3a', 3),
      same_line('4', 4),
      section(1),
      deleted_line('5', 5),
      added_line('5a', 5),
      same_line('6', 6),
      same_line('7', 7),
      same_line('8', 8)
  test 'build one chunk with one section with only lines added' do

    diff_lines =
    [
      'diff --git a/sandbox/lines b/sandbox/lines',
      'index 06e567b..59e88aa 100644',
      '--- a/sandbox/lines',
      '+++ b/sandbox/lines',
      '@@ -1,6 +1,9 @@',
      ' 1',
      ' 2',
      ' 3',
      '+3a1',
      '+3a2',
      '+3a3',
      ' 4',
      ' 5',
      ' 6'
    ].join("\n")
              :before_lines => [ '1', '2', '3' ],
                  :added_lines   => [ '3a1', '3a2', '3a3' ],
                  :after_lines => [ '4', '5', '6' ]
    source_lines =
    [
      '1',
      '2',
      '3',
      '3a1',
      '3a2',
      '3a3',
      '4',
      '5',
      '6',
      '7'
    ].join("\n")
      same_line('1', 1),
      same_line('2', 2),
      same_line('3', 3),
      section(0),
      added_line('3a1', 4),
      added_line('3a2', 5),
      added_line('3a3', 6),
      same_line('4', 7),
      same_line('5', 8),
      same_line('6', 9),
      same_line('7', 10)
  test 'build one chunk with one section with only lines deleted' do

    diff_lines =
    [
      'diff --git a/sandbox/lines b/sandbox/lines',
      'index 0b669b6..a972632 100644',
      '--- a/sandbox/lines',
      '+++ b/sandbox/lines',
      '@@ -2,8 +2,6 @@',
      ' bbb',
      ' ccc',
      ' ddd',
      '-EEE',
      '-FFF',
      ' ggg',
      ' hhh',
      ' iii'
    ].join("\n")
            'diff --git a/sandbox/lines b/sandbox/lines',
            'index 0b669b6..a972632 100644'
              :before_lines => [ 'bbb', 'ccc', 'ddd' ],
                  :deleted_lines => [ 'EEE', 'FFF' ],
                  :after_lines => [ 'ggg', 'hhh', 'iii' ]
    source_lines =
    [
      'aaa',
      'bbb',
      'ccc',
      'ddd',
      'ggg',
      'hhh',
      'iii',
      'jjj'
    ].join("\n")
      same_line('aaa', 1),
      same_line('bbb', 2),
      same_line('ccc', 3),
      same_line('ddd', 4),
      section(0),
      deleted_line('EEE', 5),
      deleted_line('FFF', 6),
      same_line('ggg', 5),
      same_line('hhh', 6),
      same_line('iii', 7),
      same_line('jjj', 8)
  test 'build one chunk with one section ' +
       'with more lines deleted than added' do

    diff_lines =
    [
      'diff --git a/sandbox/lines b/sandbox/lines',
      'index 08fe19c..1f8695e 100644',
      '--- a/sandbox/lines',
      '+++ b/sandbox/lines',
      '@@ -3,9 +3,7 @@',
      ' 3',
      ' 4',
      ' 5',
      '-6',
      '-7',
      '-8',
      '+7a',
      ' 9',
      ' 10',
      ' 11'
    ].join("\n")
            'diff --git a/sandbox/lines b/sandbox/lines',
            'index 08fe19c..1f8695e 100644'
              :before_lines => [ '3', '4', '5' ],
                  :deleted_lines => [ '6', '7', '8' ],
                  :added_lines   => [ '7a' ],
                  :after_lines => [ '9', '10', '11' ]
    source_lines =
    [
      '1',
      '2',
      '3',
      '4',
      '5',
      '7a',
      '9',
      '10',
      '11',
      '12'
    ].join("\n")
      same_line('1', 1),
      same_line('2', 2),
      same_line('3', 3),
      same_line('4', 4),
      same_line('5', 5),
      section(0),
      deleted_line('6', 6),
      deleted_line('7', 7),
      deleted_line('8', 8),
      added_line('7a', 6),
      same_line('9', 7),
      same_line('10', 8),
      same_line('11', 9),
      same_line('12', 10)
  test 'build one chunk with one section ' +
       'with more lines added than deleted' do

    diff_lines =
    [
      'diff --git a/sandbox/lines b/sandbox/lines',
      'index 8e435da..a787223 100644',
      '--- a/sandbox/lines',
      '+++ b/sandbox/lines',
      '@@ -3,7 +3,8 @@',
      ' ccc',
      ' ddd',
      ' eee',
      '-fff',
      '+XXX',
      '+YYY',
      ' ggg',
      ' hhh',
      ' iii'
    ].join("\n")
            'diff --git a/sandbox/lines b/sandbox/lines',
            'index 8e435da..a787223 100644'
              :before_lines => [ 'ccc', 'ddd', 'eee' ],
                  :deleted_lines => [ 'fff' ],
                  :added_lines   => [ 'XXX', 'YYY' ],
                  :after_lines => [ 'ggg', 'hhh', 'iii' ]
    source_lines =
    [
      'aaa',
      'bbb',
      'ccc',
      'ddd',
      'eee',
      'XXX',
      'YYY',
      'ggg',
      'hhh',
      'iii',
      'jjj',
      'kkk',
      'lll',
      'mmm'
    ].join("\n")
      same_line('aaa', 1),
      same_line('bbb', 2),
      same_line('ccc', 3),
      same_line('ddd', 4),
      same_line('eee', 5),
      section(0),
      deleted_line('fff', 6),
      added_line('XXX',6),
      added_line('YYY',7),
      same_line('ggg',   8),
      same_line('hhh',   9),
      same_line('iii',  10),
      same_line('jjj', 11),
      same_line('kkk', 12),
      same_line('lll', 13),
      same_line('mmm',14),
  test 'build one chunk with one section ' +
       'with one line deleted and one line added' do

    diff_lines =
    [
      'diff --git a/sandbox/lines b/sandbox/lines',
      'index 5ed4618..aad3f67 100644',
      '--- a/sandbox/lines',
      '+++ b/sandbox/lines',
      '@@ -5,7 +5,7 @@',
      ' aaa',
      ' bbb',
      ' ccc',
      '-QQQ',
      '+RRR',
      ' ddd',
      ' eee',
      ' fff'
    ].join("\n")
            'diff --git a/sandbox/lines b/sandbox/lines',
            'index 5ed4618..aad3f67 100644'
              :before_lines => [ 'aaa', 'bbb', 'ccc' ],
                  :deleted_lines => [ 'QQQ' ],
                  :added_lines   => [ 'RRR' ],
                  :after_lines => [ 'ddd', 'eee', 'fff' ]
    source_lines =
    [
      'zz',
      'yy',
      'xx',
      'ww',
      'aaa',
      'bbb',
      'ccc',
      'RRR',
      'ddd',
      'eee',
      'fff',
      'ggg',
      'hhh'
    ].join("\n")
      'zz', 'yy', 'xx', 'ww', 'aaa', 'bbb', 'ccc',
      'RRR',
      'ddd', 'eee', 'fff', 'ggg', 'hhh'
      same_line('zz', 1),
      same_line('yy', 2),
      same_line('xx', 3),
      same_line('ww', 4),
      same_line('aaa', 5),
      same_line('bbb', 6),
      same_line('ccc', 7),
      section(0),
      deleted_line('QQQ', 8),
      added_line('RRR', 8),
      same_line('ddd',   9),
      same_line('eee', 10),
      same_line('fff', 11),
      same_line('ggg', 12),
      same_line('hhh', 13)
  test 'count added and deleted lines' do
      same_line('a', 1),
      same_line('b', 2),
      same_line('c', 3),
      same_line('d', 4),
      same_line('e', 5),
      same_line('f', 6),
      added_line('XX',7),
      deleted_line('QQ',8),
      added_line('XX',8),
      same_line('g', 9),
      same_line('h', 10),
      same_line('i', 11),
      same_line('j', 12),
      same_line('k', 13)
    assert_equal 2, diff.count { |e| e[:type] == :added   }
  #- - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  def same_line(line,number)
    { :line => line, :type => :same, :number => number }
  end

  def deleted_line(line,number)
    { :line => line, :type => :deleted, :number => number }
  end

  def added_line(line,number)
    { :line => line, :type => :added, :number => number }
  end

  def section(index)
    { :type => :section, :index => index }
  end
