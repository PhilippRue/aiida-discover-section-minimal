#!/usr/bin/env python

from __future__ import absolute_import
from setuptools import setup

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
          install_requires=[
              "aiida-core~=1.1.1",
              "panel~=0.8.0",
              "tornado==5.1.1",
          ],
          )
