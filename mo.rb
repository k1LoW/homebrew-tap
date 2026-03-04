class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.12.0'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.12.0/mo_v0.12.0_darwin_arm64.zip'
      sha256 '817c4bb3f12a82e84352c53878c5fdd7ead42a1b2140c2e19501888a0f508c5a'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.12.0/mo_v0.12.0_darwin_amd64.zip'
      sha256 '8ee0314b406e9fa37e3af1c1d890b5845c3c4e7f9524a3a7e32fe873e8519a48'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.12.0/mo_v0.12.0_linux_arm64.tar.gz'
      sha256 '7c5f4a880641f26226649d058ad2364450e63462721a1a76e6867e8bba050425'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.12.0/mo_v0.12.0_linux_amd64.tar.gz'
      sha256 '92a71660c65d1aac22fcd3c44a86889dc53b8f9c57eb49e110e948cf8ed97c38'
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
