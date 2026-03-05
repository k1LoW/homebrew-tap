class TailorLog < Formula
  desc 'tailor-log is a tool for handling logs from a workspace on the Tailor Platform.'
  version '0.6.1'
  homepage 'https://github.com/k1LoW/tailor-log'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/tailor-log/releases/download/v0.6.1/tailor-log_v0.6.1_darwin_arm64.zip'
      sha256 '83e916e0ffc1038b2318559dcab6dfb8548425924f0b054d1cbedbebf3946a62'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tailor-log/releases/download/v0.6.1/tailor-log_v0.6.1_darwin_amd64.zip'
      sha256 '4fdf01ffcad89a934d34541f7721e58ef2a1df46e46a47669e4861c0cd3e7e40'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/tailor-log/releases/download/v0.6.1/tailor-log_v0.6.1_linux_arm64.tar.gz'
      sha256 '3761994a0febf874c4a26f3485367b0f7be38fad73609e8355059b7e84e60600'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/tailor-log/releases/download/v0.6.1/tailor-log_v0.6.1_linux_amd64.tar.gz'
      sha256 '2a4a48e2636932f0b419b8a977dc36f482355d6442d82aa131b29718d27e44bc'
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
