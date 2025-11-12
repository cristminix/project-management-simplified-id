const main = async () => {
    const response = await fetch('https://apis.iflow.cn/v1/chat/completions', {
        method: 'POST',
        headers: {
            'Authorization': 'Bearer sk-6cb17fc5e0de28f0c8608073ae3b1896',
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            model: 'qwen3-coder-plus',
            messages: [
                { role: 'user', content: 'Write a Python implementation of the quicksort algorithm' }
            ],
            temperature: 0.7,
            max_tokens: 1000
        })
    });

    const data = await response.json();
    console.log(data)
    console.log(data.choices[0].message.content);
}
main().catch(e => console.error(e))