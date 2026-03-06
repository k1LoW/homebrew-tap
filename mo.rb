class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.14.1'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.14.1/mo_v0.14.1_darwin_arm64.zip'
      sha256 '25f178e4807f878bfba48632ec1d85afd03899f0973920d24d61b717731642f4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.14.1/mo_v0.14.1_darwin_amd64.zip'
      sha256 '89e4751e605368a425f8cacf78b6b5d5a0e7e5306bb076c100ff41157470f75a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.14.1/mo_v0.14.1_linux_arm64.tar.gz'
      sha256 '76201b0f35225d5cf2f585353300f120b16bc09a2bd0e766d127d9536f38d111'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.14.1/mo_v0.14.1_linux_amd64.tar.gz'
      sha256 '4bb2ee95bf634bea06cbbc16bc966e9489f316726564706a1781b0d9cf1930a5'
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
