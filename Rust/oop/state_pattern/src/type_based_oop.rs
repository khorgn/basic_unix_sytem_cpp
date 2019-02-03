// We encode the states and behaviors as Types to make use of Rust type system
pub struct Post {
    content: String,
}

pub struct DraftPost {
    content: String,
}

impl Post {
    pub fn new() -> DraftPost {
        DraftPost {
            content: String::new(),
        }
    }
}

impl DraftPost {
    pub fn add_text(&mut self, content: &str) {
        self.content.push_str(content);
    }
    pub fn request_review(self) -> PendingReviewPost {
        PendingReviewPost {
            content: self.content
        }
    }
}

pub struct PendingReviewPost {
    content: String,
}

impl PendingReviewPost {
    pub fn approve(self) -> PublishedPost {
        PublishedPost {
            content: self.content
        }
    }
}

pub struct PublishedPost {
    content: String,
}

impl PublishedPost {
    pub fn content(&self) -> &str {
        &self.content
    }
}

#[cfg(test)]
mod Tests {
    use super::*;

    #[test]
    fn basic_test() {
        // Get a DraftPost
        let mut post = Post::new();

        post.add_text("I ate a salad for lunch today");

        // Shadow it with a PendingReviewPost
        let post = post.request_review();

        // Shadow it with a PublishedPost
        let post = post.approve();

        assert_eq!("I ate a salad for lunch today", post.content());
    }
}
