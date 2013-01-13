require 'formula'

class Jubatus < Formula
  head 'git://github.com/jubatus/jubatus.git'
  homepage 'http://jubat.us/'
  md5 '79b6cf2ee5fc7f733fcd6f5cc5f7ec62'

  depends_on 'glog'
  depends_on 'pkg-config'
  depends_on 'pficommon'
  depends_on 'jubatus-mpio'

  def options
    [
     [ '--disable-zookeeper', 'if not nessesary' ],
     [ '--disable-re2', 'if not nessesary'],
     [ '--enable-mecab', 'if nesseary' ]
    ]
  end

  def install
    args = []
    args << "--disable-zookeeper" if ARGV.include? "--disable-zookeeper"
    args << "--disable-re2" if ARGV.include? "--disable-re2"
    system "./waf", "configure", "--prefix=#{prefix}", *args
    system "./waf", "build"
    system "./waf", "install"
  end

#  def patches
#    {:p0 => "https://raw.github.com/gist/1344700/8abcfec9fb3344954da89386b6d03683c7ccee8c/wscript.diff"}
#  end

  def test
    # This test will fail and we won't accept that! It's enough to just
    # replace "false" with the main program this formula installs, but
    # it'd be nice if you were more thorough. Test the test with
    # `brew test jubatus`. Remove this comment before submitting
    # your pull request!
    system "false"
  end
end
