class Frgm < Formula
  desc 'frgm is a meta snippet (fragment) manager.'
  version '0.11.0'
  homepage 'https://github.com/k1LoW/frgm'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/frgm/releases/download/v0.11.0/frgm_v0.11.0_darwin_arm64.zip'
      sha256 'd19214e4a87b4a4ee397fb7d907d32bf2d9e48586fab05e6d41e18fa91a82764'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/frgm/releases/download/v0.11.0/frgm_v0.11.0_darwin_amd64.zip'
      sha256 '85c5a6eb7bca8b7aad508eb83e5b803e8d1b9a6e16d5650d6ffcb95136412729'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/frgm/releases/download/v0.11.0/frgm_v0.11.0_linux_arm64.tar.gz'
      sha256 'a4b976eb665db2153a3c742000d4b628c56a2eaf76f7ac4b254238091d159dbf'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/frgm/releases/download/v0.11.0/frgm_v0.11.0_linux_amd64.tar.gz'
      sha256 '522719392199323a73406fa616eb504bad66c41abc16f8b9cdd09f439392372f'
    end
  end

  head do
    url 'https://github.com/k1LoW/frgm.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'frgm'
  end
end
