class Cuestr < Formula
  desc 'cuestr is a utility tool for string literals in CUE files.'
  version '0.3.0'
  homepage 'https://github.com/k1LoW/cuestr'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.3.0/cuestr_v0.3.0_darwin_arm64.zip'
      sha256 '1af2a61709dcf7329070f9b74bb3f64af9a8ab5113559a78388af1af782ee80c'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.3.0/cuestr_v0.3.0_darwin_amd64.zip'
      sha256 '26cf630d0eb354553fc784b0d1bf3fba7fa7e9fc4247537ef094ec7d1bf3e2b1'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.3.0/cuestr_v0.3.0_linux_arm64.tar.gz'
      sha256 '13a75094be95f261b89e941a8f56338d7e805c7b5fe7a2b6ba6f49c83ce9393a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/cuestr/releases/download/v0.3.0/cuestr_v0.3.0_linux_amd64.tar.gz'
      sha256 '4fc21a8e7ef5b3b36a07dae4d45513b9580c289b74224952faa498fb8528b245'
    end
  end

  head do
    url 'https://github.com/k1LoW/cuestr.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'cuestr'
  end
end
