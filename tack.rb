class Tack < Formula
  desc 'tack is a one-shot deploy CLI for Tailor Platform Static Website Hosting'
  version '0.1.1'
  homepage 'https://github.com/k1LoW/tack'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tack/releases/download/v0.1.1/tack_v0.1.1_darwin_arm64.zip'
      sha256 'df5ed355e71d5e0fcc52e31d1dd3b2f3d4ae061f49db88ad5740328ba19d19f9'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tack/releases/download/v0.1.1/tack_v0.1.1_darwin_amd64.zip'
      sha256 '81bddba786dc60897926fcd3e57605627c553e0ba4ab0a4031de2174f4160a98'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tack/releases/download/v0.1.1/tack_v0.1.1_linux_arm64.tar.gz'
      sha256 '1e93fa3f0eab4f8b2dd4c5151a6819cd13996269f64efb50ae7bbdc57d1b9ab5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tack/releases/download/v0.1.1/tack_v0.1.1_linux_amd64.tar.gz'
      sha256 '43dc6f70a3fe5d518b86695e318ce54e870991cbcb2913f58a596a818aa68f38'
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
