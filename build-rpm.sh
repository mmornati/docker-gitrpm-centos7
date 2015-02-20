#!/bin/bash

rpmbuild -ba ~/rpmbuild/SPECS/git.spec

cp -r ~/rpmbuild/SRPMS /rpms
cp -r ~/rpmbuild/RPMS /rpms
