class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.13.1'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.13.1/mo_v0.13.1_darwin_arm64.zip'
      sha256 '23d44cfd99488a0a3d4865afc6e41fb71afb5c339f5ff4516ff8638ee347fe2f'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.13.1/mo_v0.13.1_darwin_amd64.zip'
      sha256 '978a468c0f640bff3032a258cda65a6a5b12a35f53f366e5c36b9b1698316a59'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.13.1/mo_v0.13.1_linux_arm64.tar.gz'
      sha256 '56d1c03e3bd1a9b5d2da93fac418f3b574a41bbce54b081f255a89c6b0849dc2'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.13.1/mo_v0.13.1_linux_amd64.tar.gz'
      sha256 'f4155c5399debd333dc5d6278f370cad75f8f80df368cd80ac59b9c72d9ebf66'
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
