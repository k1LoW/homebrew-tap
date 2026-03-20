class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.20.1'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.20.1/mo_v0.20.1_darwin_arm64.zip'
      sha256 '9a534b614e47afd4a4eb74735bf9a4a63ec26eb939d393b339d69b11b4bd51d5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.20.1/mo_v0.20.1_darwin_amd64.zip'
      sha256 '1583cf67ca811f0270cf5cf517303f7a70706f383deae74ed96ddf512e60d48d'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.20.1/mo_v0.20.1_linux_arm64.tar.gz'
      sha256 '01014d9869a66829999ac9717dec376556a84c510e829a82c78f2addd55852a5'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.20.1/mo_v0.20.1_linux_amd64.tar.gz'
      sha256 '18087eda3be53125a28a2455f6ceb49a9e949965924feb7286d7304d74701f5d'
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
