function getPostData() 
    file = io.open("byteData", "r")
    local readall = file:read("*a")
    return readall
end

wrk.method = "POST"
wrk.body = getPostData()
wrk.headers["Content-Type"] = "application/octet-stream"

-- wrk -t4 -d30s -c100  --latency --script=post.lua http://localhost:8080/
-- curl  -H "Content-Type:application/octet-stream" --data-binary @byteData  http://127.0.0.1:8080/