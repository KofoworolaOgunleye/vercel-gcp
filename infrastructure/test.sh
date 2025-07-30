#!/usr/bin/env bash
COOKIE_JAR=cookie.txt

# First request: this will set the affinity cookie in cookie.txt
curl -s -o /dev/null -D - -c $COOKIE_JAR "https://blue-green.example-test.com"

echo "Now make 10 more requests with that same cookie…"
for i in {1..10}; do
  hdr=$(curl -s -o /dev/null -D - -b $COOKIE_JAR "https://blue-green.thenational.academy/")

  if grep -qi "X-Cf-Pool: netlify-pool" <<<"$hdr"; then
    echo "  → Netlify"
  else
    echo "  → Vercel"
  fi
done

# echo "kk"

#     echo "Testing traffic distribution..."
    
#     DOMAIN="https://blue-green.thenational.academy/"
#     NETLIFY_COUNT=0
#     VERCEL_COUNT=0
#     TOTAL_REQUESTS=100
    
#     echo "Making $TOTAL_REQUESTS requests to test distribution..."
    
#     for i in $(seq 1 $TOTAL_REQUESTS); do
#         RESPONSE=$(curl -s "$DOMAIN")
        
#         if echo "$RESPONSE" | grep -q "Blue Env"; then
#             ((NETLIFY_COUNT++))
#         elif echo "$RESPONSE" | grep -q "Green Env"; then
#             ((VERCEL_COUNT++))
#         fi
        
#         # Progress indicator
#         if [ $((i % 10)) -eq 0 ]; then
#             echo -n "."
#         fi
#     done
#       echo ""
#     echo "Results after $TOTAL_REQUESTS requests:"
#     echo "Netlify (Blue): $NETLIFY_COUNT requests ($(echo "scale=1; $NETLIFY_COUNT*100/$TOTAL_REQUESTS" | bc)%)"
#     echo "Vercel (Green): $VERCEL_COUNT requests ($(echo "scale=1; $VERCEL_COUNT*100/$TOTAL_REQUESTS" | bc)%)"

