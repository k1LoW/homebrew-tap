class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.16.1'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.16.1/mo_v0.16.1_darwin_arm64.zip'
      sha256 '30bfdd68b6e50f5d9e368256d3a750bccf68c9f1303601a723e1f19695653c5d'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.16.1/mo_v0.16.1_darwin_amd64.zip'
      sha256 'e1489be9e6410ca148e305c001a040892d21edd7977b3614daa9475022bac0a6'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.16.1/mo_v0.16.1_linux_arm64.tar.gz'
      sha256 '5a5f3539230e616df5c5cfe7cb893d53d1b59e02da4c2243eb6ba9ca1dd0c86a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.16.1/mo_v0.16.1_linux_amd64.tar.gz'
      sha256 '06b016c085f584b3114e0234aa24d094f9e30961383ab3b4f848979901a01f03'
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
