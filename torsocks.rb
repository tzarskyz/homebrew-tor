require 'formula'

class Torsocks < Formula
  homepage 'https://github.com/dgoulet/torsocks.git/'
  url 'https://github.com/dgoulet/torsocks.git', :tag => '2.0.0-rc2'

  head 'https://github.com/dgoulet/torsocks.git', :branch => 'master'

  depends_on :autoconf
  depends_on :automake
  depends_on :libtool
  depends_on 'tor'

  def install
    system "./autogen.sh"
    system "./configure", "--disable-debug", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make install"
  end

  def test
    system "#{bin}/torsocks"
  end
end
