class Tack < Formula
  desc 'tack is a one-shot deploy CLI for Tailor Platform Static Website Hosting'
  version '0.2.1'
  homepage 'https://github.com/k1LoW/tack'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tack/releases/download/v0.2.1/tack_v0.2.1_darwin_arm64.zip'
      sha256 'a8a2c52de242004d4e8b408dcf327f55dbdd0a3461ee9fe49dcc3363a4607c72'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tack/releases/download/v0.2.1/tack_v0.2.1_darwin_amd64.zip'
      sha256 'a419f0a7eb2d691a679c7ddc9e7b217e93fa5a6327be3f084965f636765b6846'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tack/releases/download/v0.2.1/tack_v0.2.1_linux_arm64.tar.gz'
      sha256 '09e1baa31c6ae2ec756d8913e9f6b54ba1676bf5f911efabcaea31bbeab13f7f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tack/releases/download/v0.2.1/tack_v0.2.1_linux_amd64.tar.gz'
      sha256 '283c57ed5af872432c94a992a9729c6e677235fa8cb39870488ca141522c0006'
    end
  end

  head do
    url 'https://github.com/k1LoW/tack.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tack'
    generate_completions_from_executable(bin/'tack', 'completion')
  end
end
