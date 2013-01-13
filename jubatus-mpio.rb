require 'formula'

class JubatusMpio < Formula
  head 'git://github.com/jubatus/jubatus-mpio.git'
  homepage 'https://github.com/jubatus/jubatus-mpio'
  md5 ''

  env :std

  def options
    [
     [ '--disable-zookeeper', 'if not nessesary' ],
     [ '--disable-re2', 'if not nessesary'],
     [ '--enable-mecab', 'if nesseary' ]
    ]
  end

  def install
    system "./bootstrap"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make install"
  end
end

