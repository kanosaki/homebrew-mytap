require 'formula'

class Pficommon < Formula
  head 'https://github.com/pfi/pficommon.git'
  homepage ''
  md5 ''

  depends_on 'msgpack'

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  def test
    # This test will fail and we won't accept that! It's enough to just
    # replace "false" with the main program this formula installs, but
    # it'd be nice if you were more thorough. Test the test with
    # `brew test pficommon`. Remove this comment before submitting
    # your pull request!
    system "false"
  end
end
