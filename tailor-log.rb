class TailorLog < Formula
  desc 'tailor-log is a tool for handling logs from a workspace on the Tailor Platform.'
  version '0.5.0'
  homepage 'https://github.com/k1LoW/tailor-log'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tailor-log/releases/download/v0.5.0/tailor-log_v0.5.0_darwin_arm64.zip'
      sha256 '73e3ae34cff2f209457f2fd9a4b55bab00a5049d6e14301498b4c5b2eb816587'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tailor-log/releases/download/v0.5.0/tailor-log_v0.5.0_darwin_amd64.zip'
      sha256 'ca067eeeb2ad85dd547d125bb45b4b7e5b2e1ed55095f0aa66aeb501fbf2f2e8'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tailor-log/releases/download/v0.5.0/tailor-log_v0.5.0_linux_arm64.tar.gz'
      sha256 '601775c13a40765cf120dd70b6dfdc86033e4e16eba804d5e0b5a7dfe4ad1f52'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tailor-log/releases/download/v0.5.0/tailor-log_v0.5.0_linux_amd64.tar.gz'
      sha256 'e1120efe2bd70ae45888e7b390f7e437fd5cf0a7dc84533618af07f1865b929e'
    end
  end

  head do
    url 'https://github.com/k1LoW/tailor-log.git'
    depends_on 'go' => :build
  end

  def install
    if build.head?
      system 'make', 'build'
    end
    bin.install 'tailor-log'
  end
end
