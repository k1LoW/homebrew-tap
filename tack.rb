class Tack < Formula
  desc 'tack is a one-shot deploy CLI for Tailor Platform Static Website Hosting'
  version '0.4.0'
  homepage 'https://github.com/k1LoW/tack'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tack/releases/download/v0.4.0/tack_v0.4.0_darwin_arm64.zip'
      sha256 '8fef7db85335f5eb3ea897482bc0f2e875c2cbfcc04440358fb9efa40671fb4f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tack/releases/download/v0.4.0/tack_v0.4.0_darwin_amd64.zip'
      sha256 '9c49f888333cecf236ea9c86afa3751de324b42eb567189fe327394ad346677e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tack/releases/download/v0.4.0/tack_v0.4.0_linux_arm64.tar.gz'
      sha256 'c8c0ffd61b6f71f7d991c03461237e42df985c8d025ee08ea016dbe7a5a4b9ee'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tack/releases/download/v0.4.0/tack_v0.4.0_linux_amd64.tar.gz'
      sha256 '196dbe84a5147d356c7888f1124f3d870a9c84e9bff7005324d5ed2ded8efb0a'
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
