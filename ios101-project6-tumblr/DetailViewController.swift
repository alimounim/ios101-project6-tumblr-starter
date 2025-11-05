//
//  DetailViewController.swift
//  ios101-project6-tumblr
//
//  Created by Ali Mounim Rajabi on 11/5/25.
//

import UIKit
import NukeExtensions

class DetailViewController: UIViewController {

    // MARK: - Outlets (already connected in storyboard)
    @IBOutlet weak var posterImageView: UIImageView!

    @IBOutlet weak var captionTextView: UITextView!
    
    // MARK: - Model
       var post: Post!   // from your Post.swift model
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        captionTextView.text = "TEST — if you can read this, the UI is fine."
        captionTextView.textColor = .label
        captionTextView.backgroundColor = .clear

        super.viewDidLoad()


        // Configure text view
        captionTextView.isEditable = false
        captionTextView.isSelectable = false
        captionTextView.isScrollEnabled = true
        
        // Configure caption text
        if let plainCaption = post.caption.trimHTMLTags() {
            captionTextView.text = plainCaption
        } else {
            captionTextView.text = post.caption
        }

        // Configure the image
        if let photo = post.photos.first {
            NukeExtensions.loadImage(with: photo.originalSize.url, into: posterImageView)
        } else {
            posterImageView.image = UIImage(systemName: "photo")
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
