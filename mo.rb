class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '1.6.8'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.8/mo_v1.6.8_darwin_arm64.zip'
      sha256 '234fc265409944a46b90e63ab48917b472a1390b83864593b587f4cf636a5238'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.8/mo_v1.6.8_darwin_amd64.zip'
      sha256 '72722f16dad948ef628100415f8e4aea9acfd38680af53c60c17faf0a6166995'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.8/mo_v1.6.8_linux_arm64.tar.gz'
      sha256 'ac5b101d6bd5eb626cc82d3a3591df1a3f115259d46b5435a752e0f2289ab695'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.6.8/mo_v1.6.8_linux_amd64.tar.gz'
      sha256 '33972709836832579fde45adb8512bd15f444dc484ff988c0331579d35f115b8'
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
