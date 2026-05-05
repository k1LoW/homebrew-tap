class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '1.5.2'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v1.5.2/mo_v1.5.2_darwin_arm64.zip'
      sha256 '807154af15d45746ee82eeca14ddfa73b6671c8608cb149edaaa5a20f6b5219f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.5.2/mo_v1.5.2_darwin_amd64.zip'
      sha256 'f3108cfc277686f629f82abbc3a472a08d7004dc208b4908c0ce0c55b0f17b3f'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v1.5.2/mo_v1.5.2_linux_arm64.tar.gz'
      sha256 'd625429c4bae5925f560abb67d8bc60d22053b34fd826a204d97525a68597391'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v1.5.2/mo_v1.5.2_linux_amd64.tar.gz'
      sha256 'e57fe46c349c56a7b970bbaf792d79c149cb1b3a41ff29265e89f81022b20516'
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
