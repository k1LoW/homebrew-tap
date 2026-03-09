class Mo < Formula
  desc 'mo is a Markdown viewer that opens .md files in a browser.'
  version '0.16.2'
  homepage 'https://github.com/k1LoW/mo'

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/k1LoW/mo/releases/download/v0.16.2/mo_v0.16.2_darwin_arm64.zip'
      sha256 '6b535d69e1949b38f7601391b2b1d7eab5372180ca01ec2c4d158b4dbdc39c52'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.16.2/mo_v0.16.2_darwin_amd64.zip'
      sha256 '98211edc9dbde3dfa5daa4e4c89f1eb7d767c3db2a81c3de1868ffe90c30984a'
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url 'https://github.com/k1LoW/mo/releases/download/v0.16.2/mo_v0.16.2_linux_arm64.tar.gz'
      sha256 '4fdf14e328de602d06d548a1fdf46c26eb8d9394ad03d82ad2f71b2a4b9ffb73'
    end
    if Hardware::CPU.intel?
      url 'https://github.com/k1LoW/mo/releases/download/v0.16.2/mo_v0.16.2_linux_amd64.tar.gz'
      sha256 '0f3573f7dba180dadca1970c112489833657e8c5bcb013e9dee58d58cc345226'
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
