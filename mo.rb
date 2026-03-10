class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.18.1'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.18.1/mo_v0.18.1_darwin_arm64.zip'
      sha256 'a709563400be4b0101127f9958d63823459aae7c284876b60adc19de5156db38'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.18.1/mo_v0.18.1_darwin_amd64.zip'
      sha256 '503e481c90d772e7e78f485c2eeced6ceaf99cbe7beb8de5d5af9d0ff0aa1ae5'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.18.1/mo_v0.18.1_linux_arm64.tar.gz'
      sha256 '3884167a6e78459ecb5819fbf3492adab7d08e260aef0f6261485f9fd209b902'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.18.1/mo_v0.18.1_linux_amd64.tar.gz'
      sha256 '5237e69d98fbd2b289bb579a1dd5e62d9415353ab698b3fe4d21b405c6768b00'
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
