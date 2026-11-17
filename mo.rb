class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '1.8.1'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v1.8.1/mo_v1.8.1_darwin_arm64.zip'
      sha256 '634bf5cc81e6f91fd8248f99a531cf85b63ef00b6507695dbb49e529f5e38cae'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.8.1/mo_v1.8.1_darwin_amd64.zip'
      sha256 'f9bf5ca11aa2a2b344910fbf7423dbefeff2fa99635bc2401599f829ee6dd0c4'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v1.8.1/mo_v1.8.1_linux_arm64.tar.gz'
      sha256 'be80f64bc727700b748e05786efb45529f10ed15496f51a3f1055d21473ceb5e'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.8.1/mo_v1.8.1_linux_amd64.tar.gz'
      sha256 'f225798089834417259d3a5c3b0194c5158a40e657f4b0d83cd56145b1a3259a'
    end
  end

  head do
    url 'https://github.com/k1LoW/mo.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'mo'
    generate_completions_from_executable(bin/'mo', 'completion')
  end
end
