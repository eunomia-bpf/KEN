import requests
from lxml import etree

def scrape_blog_posts():
    """
    Scrapes blog posts from a website and saves them as text files.

    Returns:
        None
    """
    url = "https://www.brendangregg.com/blog/index.html"

    # Send a GET request to the website
    response = requests.get(url)
    html_content = response.content

    # Parse the HTML content
    tree = etree.HTML(html_content)
    a_elements = tree.xpath('//*[@id="home"]/ul/li/a')

    # Iterate through the blog post links
    for a in a_elements:
        # Get the post URL and title
        url = "https://www.brendangregg.com/" + a.get("href")
        title = a.text.replace('/', ' or ')
        print(f"Link: {url}\tText: {title}")

        # Fetch the post content
        response = requests.get(url)
        html_content = response.content
        tree = etree.HTML(html_content)
        post_element = tree.xpath('/html/body/div/div[3]/div[2]//text()')

        # Extract and clean the post content
        content = ' '.join(text.strip() for text in post_element if text.strip())

        # Save the post content as a text file
        filename = f"posts/{title}.txt"
        with open(filename, 'w', encoding='utf-8') as file:
            file.write(content)
        print(f"The article has been successfully saved as {filename} file.")

if __name__ == "__main__":
    scrape_blog_posts()
