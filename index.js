const express = require("express");
const bodyParser = require("body-parser");
const path = require("path");
const mysql = require("mysql2");

// Create Express app
const app = express();

//serve static files
app.use(express.static("public"));

// Set up the view engine
app.set("view engine", "ejs");
app.set("views", path.join(__dirname, "views"));

// Middleware
app.use(bodyParser.urlencoded({ extended: false }));

// Database connection
const db = require("./database.js");

// Routes

// Serve images directly from the database
app.get("/images/:id", (req, res) => {
  const query = "SELECT image FROM c_variants WHERE variant_id = ?";
  db.query(query, [req.params.id], (err, results) => {
    if (err) throw err;
    if (results.length > 0) {
      const img = results[0].image;
      res.writeHead(200, {
        "Content-Type": "image/png", // or 'image/jpeg' depending on the stored image format
        "Content-Length": img.length,
      });
      res.end(img);
    } else {
      res.status(404).send("Image not found");
    }
  });
});

// Home Page - List all variants
app.get("/", (req, res) => {
  const query =
    "SELECT v.*, c.classification, c.attributes FROM c_variants v JOIN c_classification c ON v.classification_id = c.classification_id ORDER BY date_first_detected DESC";
  db.query(query, (err, results) => {
    if (err) throw err;
    res.render("home", { variants: results });
  });
});

// Add Variant Page
app.get("/add", (req, res) => {
  const query = "SELECT * FROM c_classification";
  db.query(query, (err, results) => {
    if (err) throw err;
    res.render("add_variant", { classifications: results });
  });
});

app.post("/add", (req, res) => {
  const {
    variant_name,
    country_first_detected,
    date_first_detected,
    description,
    classification_id,
  } = req.body;
  const query =
    "INSERT INTO c_variants (variant_name, country_first_detected, date_first_detected, description, classification_id) VALUES (?, ?, ?, ?, ?)";
  db.query(
    query,
    [
      variant_name,
      country_first_detected,
      date_first_detected,
      description,
      classification_id,
    ],
    (err, result) => {
      if (err) throw err;
      res.redirect("/");
    },
  );
});

// Update Variant Page
app.get("/update/:id", (req, res) => {
  const queryVariant = "SELECT * FROM c_variants WHERE variant_id = ?";
  const queryClassification = "SELECT * FROM c_classification";
  db.query(queryVariant, [req.params.id], (err, variantResults) => {
    if (err) throw err;
    db.query(queryClassification, (err, classificationResults) => {
      if (err) throw err;
      res.render("update_variant", {
        variant: variantResults[0],
        classifications: classificationResults,
      });
    });
  });
});

app.post("/update/:id", (req, res) => {
  const { country_first_detected, classification_id } = req.body;
  const query =
    "UPDATE c_variants SET country_first_detected = ?, classification_id = ? WHERE variant_id = ?";
  db.query(
    query,
    [country_first_detected, classification_id, req.params.id],
    (err, result) => {
      if (err) throw err;
      res.redirect("/");
    },
  );
});

// Delete Variant Route
app.post("/delete/:id", (req, res) => {
  const variantId = req.params.id;

  const query = "DELETE FROM c_variants WHERE variant_id = ?";
  db.query(query, [variantId], (err, result) => {
    if (err) throw err;
    res.redirect("/"); // Redirect back to the home page after deletion
  });
});

// Trivia Page
app.get("/trivia", (req, res) => {
  const queryVariant = "SELECT * FROM c_variants ORDER BY RAND() LIMIT 1";
  const queryCountry = "SELECT DISTINCT country_first_detected FROM c_variants";
  db.query(queryVariant, (err, variantResults) => {
    if (err) throw err;
    db.query(queryCountry, (err, countryResults) => {
      if (err) throw err;
      res.render("trivia", {
        variant: variantResults[0],
        countries: countryResults,
      });
    });
  });
});
app.post("/trivia", (req, res) => {
  const { country, variant_id } = req.body;

  // Fetch the variant details again from the database
  const queryVariant = "SELECT * FROM c_variants WHERE variant_id = ?";
  const queryCountry = "SELECT DISTINCT country_first_detected FROM c_variants";

  db.query(queryVariant, [variant_id], (err, variantResults) => {
    if (err) throw err;

    const variant = variantResults[0];
    const correct = variant.country_first_detected === country;

    db.query(queryCountry, (err, countryResults) => {
      if (err) throw err;

      // Pass the correct data to the view
      res.render("trivia", {
        variant: variant,
        countries: countryResults,
        correct: correct,
      });
    });
  });
});

// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
