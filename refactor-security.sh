#!/bin/bash
# refactor-security.sh
# Célszerű futtatni a projekt rootjából
# Backup minden SecurityConfig.java fájlról készül

find . -type f -name "SecurityConfig.java" | while read file; do
    echo "Refaktorálás: $file"
    cp "$file" "$file.bak"  # backup
    sed -i \
        -e 's/authorizeRequests(/authorizeHttpRequests(/g' \
        -e 's/\.antMatchers(/.requestMatchers(/g' \
        -e 's/.anyRequest().authenticated()/.anyRequest().authenticated()/g' \
        "$file"
done

echo "Refaktorálás kész. Minden fájl backup .bak kiterjesztéssel."

