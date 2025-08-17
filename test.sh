#!/bin/bash
curl -s http://localhost:3006/health | grep "Still working" && echo "PASS ✅" || echo "FAIL ❌"