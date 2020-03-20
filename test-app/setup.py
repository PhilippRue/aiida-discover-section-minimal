#!/usr/bin/env python

from __future__ import absolute_import
from setuptools import setup
from pip.req import parse_requirements

# parse_requirements() returns generator of pip.req.InstallRequirement objects
install_reqs = parse_requirements('requirements.txt')

# reqs is a list of requirement
reqs = [str(ir.req) for ir in install_reqs]

if __name__ == '__main__':
    # Provide static information in setup.json
    # such that it can be discovered automatically
    setup(name="aiida-discover-section-minimal",
          author="Philipp Rüßmann",
          author_email="p.ruessmann@fz-juelich.de",
          description="Running aiida in a container.",
          license="MIT",
          classifiers=["Programming Language :: Python"],
          version="0.1.0",
          install_requires=reqs,
          )
