class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.23.4'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.23.4/mo_v0.23.4_darwin_arm64.zip'
      sha256 'f7fc9fb72d956203c20f6c8714708e478e95a7e02cb9c64bd280098ad9583626'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.23.4/mo_v0.23.4_darwin_amd64.zip'
      sha256 '87ea56bb00fa51f97891f332391525ad2a01585e124d16a0438fb866e17d386e'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.23.4/mo_v0.23.4_linux_arm64.tar.gz'
      sha256 '01b31d679b154e37adb702176659dcbe3753f54be6a30eef2712de00328388c4'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.23.4/mo_v0.23.4_linux_amd64.tar.gz'
      sha256 'a92674fdce8785cbe5dd6c88aeef43e3e818612cba512bd77027573c7862e4ae'
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
