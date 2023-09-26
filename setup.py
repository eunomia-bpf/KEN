from typing import List

import setuptools
from setuptools import find_packages

with open("README.md", "r") as fh:
    long_description = fh.read()


def parse_requirements(file_name: str) -> List[str]:
    with open(file_name) as f:
        return [
            require.strip()
            for require in f
            if require.strip() and not require.startswith("#")
        ]


setuptools.setup(
    name="kenl",
    packages=find_packages(),
    version="0.1.0",
    author=["yunwei","victoryang00","agaaaub.try"],
    author_email=["yunwei356@gmail.com","victoryang00@ucsc.edu","agaaaub.try@gmail.com"],
    description="KENL is an experimental open-source project that uses localized GPT large models to maintain your Linux as prompted and verified the semantic by automatic assertion verification.",
    long_description=long_description,
    long_description_content_type="text/markdown",
    install_requires=parse_requirements("requirements.txt"),
    url="https://github.com/eunomia-bpf/KENL",
    license="https://opensource.org/license/mit/",
    python_requires=">=3.8",
    zip_safe=False
)