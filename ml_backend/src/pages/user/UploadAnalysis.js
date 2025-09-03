import React, { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import axios from "axios";
import {
  Container,
  Box,
  Typography,
  Card,
  CardContent,
  Grid,
  Button,
  TextField,
  CircularProgress,
  Alert,
  Table,
  TableBody,
  TableCell,
  TableContainer,
  TableHead,
  TableRow,
  Paper,
  ThemeProvider,
  createTheme,
} from "@mui/material";
import { Upload as UploadIcon } from "@mui/icons-material";
import Header from "../../components/Header";
import Footer from "../../components/Footer";

// Custom theme for consistent styling
const theme = createTheme({
  palette: {
    primary: { main: "#1976D2", dark: "#1565C0" },
    secondary: { main: "#2E7D32", dark: "#1B5E20" },
    accent: { main: "#D32F2F", dark: "#C62828" },
    orders: { main: "#FFBB28", dark: "#F0A500" },
    chartColors: ["#1976D2", "#2E7D32", "#D32F2F", "#FFBB28", "#00C49F"],
  },
  typography: {
    fontFamily: '"Roboto", "Helvetica", "Arial", sans-serif',
    h3: { fontWeight: 700 },
    h5: { fontWeight: 600 },
  },
  components: {
    MuiCard: {
      styleOverrides: {
        root: {
          transition: "background-color 0.3s",
          borderRadius: 12,
          boxShadow: "0 4px 12px rgba(0,0,0,0.1)",
        },
      },
    },
  },
});

// Reusable TableWrapper component
const TableWrapper = ({ title, children, loading }) => (
  <Box mt={4}>
    <Typography variant="h5" mb={2} aria-label={title}>
      {title}
    </Typography>
    {loading ? (
      <Box sx={{ display: "flex", justifyContent: "center", py: 4 }}>
        <CircularProgress />
      </Box>
    ) : (
      <TableContainer component={Paper} elevation={3} sx={{ borderRadius: 2 }}>
        {children}
      </TableContainer>
    )}
  </Box>
);

function UploadAnalysis() {
  const [file, setFile] = useState(null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState("");
  const [result, setResult] = useState(null);
  const [reports, setReports] = useState([]);
  const [reportsLoading, setReportsLoading] = useState(false);
  const [reportsError, setReportsError] = useState("");
  const navigate = useNavigate();
  const userId = localStorage.getItem("user_id");
  const token = localStorage.getItem("token");

  // Check if user is logged in
  useEffect(() => {
    console.log("Checking auth - userId:", userId, "token:", token);
    if (!userId || !token) {
      console.log("Redirecting to /login");
      navigate("/login");
    } else {
      fetchReports();
    }
  }, [userId, token, navigate]);

  const fetchReports = async () => {
    setReportsLoading(true);
    setReportsError("");
    try {
      const response = await axios.get("http://127.0.0.1:5000/reports", {
        headers: { Authorization: `Bearer ${token}` },
      });
      console.log("Reports response:", response.data); // Debug
      setReports(response.data);
    } catch (err) {
      setReportsError("Failed to load reports. Please try again.");
      console.error("Reports error:", err);
    } finally {
      setReportsLoading(false);
    }
  };

  const handleFileChange = (e) => {
    setFile(e.target.files[0]);
    setError("");
    setResult(null);
  };

  const handleUpload = async () => {
    if (!file) {
      setError("Please select an audio or video file.");
      return;
    }

    const formData = new FormData();
    formData.append("file", file);

    setLoading(true);
    setError("");
    setResult(null);

    try {
      const response = await axios.post("http://127.0.0.1:5000/index", formData, {
        headers: {
          "Content-Type": "multipart/form-data",
          Authorization: `Bearer ${token}`,
        },
        timeout: 60000, // 60 seconds
      });
      console.log("Upload response:", response.data); // Debug
      if (response.data.success) {
        setResult(response.data.result);
        fetchReports();
      } else {
        setError(response.data.message || "Analysis failed.");
      }
    } catch (err) {
      console.error("Upload error:", err);
      setError(
        err.response?.data?.message ||
          "Failed to analyze file. Please check file format or try again."
      );
    } finally {
      setLoading(false);
    }
  };

  const handleLogout = () => {
    localStorage.removeItem("user_id");
    localStorage.removeItem("token");
    localStorage.removeItem("user");
    localStorage.removeItem("keepSignedIn");
    navigate("/login");
  };

  return (
    <ThemeProvider theme={theme}>
      <Header onLogout={handleLogout} />
      <main className="main" style={{ padding: "2rem 0", backgroundColor: "#f5f5f5" }}>
        <Container maxWidth="xl">
          <Typography variant="h3" align="center" gutterBottom>
            Analysis via Upload
          </Typography>
          <Typography variant="body1" align="center" color="textSecondary" mb={4}>
            Upload an audio or video file to analyze your confidence level.
          </Typography>

          {error && (
            <Alert
              severity="error"
              sx={{ mb: 4 }}
              action={
                <Button
                  color="inherit"
                  size="small"
                  onClick={() => {
                    setError("");
                    if (file) handleUpload();
                  }}
                >
                  Retry
                </Button>
              }
            >
              {error}
            </Alert>
          )}

          <Grid container spacing={3} justifyContent="center">
            <Grid item xs={12} md={6}>
              <Card>
                <CardContent>
                  <Typography variant="h5" gutterBottom>
                    Upload File
                  </Typography>
                  <Box component="form" sx={{ mt: 2 }}>
                    <TextField
                      type="file"
                      fullWidth
                      inputProps={{ accept: "audio/wav,audio/mp3,video/mp4,video/avi" }}
                      onChange={handleFileChange}
                      disabled={loading}
                      aria-label="Select audio or video file"
                    />
                    <Button
                      variant="contained"
                      color="primary"
                      fullWidth
                      startIcon={<UploadIcon />}
                      onClick={handleUpload}
                      disabled={loading || !file}
                      sx={{ mt: 2 }}
                      aria-label="Upload and analyze file"
                    >
                      {loading ? "Analyzing..." : "Analyze"}
                    </Button>
                  </Box>
                </CardContent>
              </Card>
            </Grid>
          </Grid>

          {result && (
            <Grid container spacing={3} mt={4} justifyContent="center">
              <Grid item xs={12} md={6}>
                <Card>
                  <CardContent>
                    <Typography variant="h5" gutterBottom>
                      Analysis Results
                    </Typography>
                    <Typography variant="body1" sx={{ mb: 1 }}>
                      <strong>Transcribed Text:</strong> {result.transcribed_text || "N/A"}
                    </Typography>
                    <Typography variant="body1" sx={{ mb: 1 }}>
                      <strong>Pronunciation Assessment:</strong>{" "}
                      {result.pronunciation_assessment || "N/A"}
                    </Typography>
                    {result.confident_percentage && (
                      <Typography variant="body1" sx={{ mb: 1 }}>
                        <strong>Confident Percentage:</strong> {result.confident_percentage}
                      </Typography>
                    )}
                    {result.not_confident_percentage && (
                      <Typography variant="body1" sx={{ mb: 1 }}>
                        <strong>Not Confident Percentage:</strong>{" "}
                        {result.not_confident_percentage}
                      </Typography>
                    )}
                    <Typography variant="body1" sx={{ mb: 1 }}>
                      <strong>Most Repeated Word:</strong> {result.most_repeated_word || "N/A"}
                    </Typography>
                    <Typography variant="body1" sx={{ mb: 1 }}>
                      <strong>General Suggestion:</strong> {result.general_suggestion || "N/A"}
                    </Typography>
                  </CardContent>
                </Card>
              </Grid>
            </Grid>
          )}

          <TableWrapper title="Analysis Reports" loading={reportsLoading}>
            <Table aria-label="Analysis reports table">
              <TableHead>
                <TableRow sx={{ bgcolor: "#f5f5f5" }}>
                  <TableCell sx={{ fontWeight: "bold" }}>Pronunciation Assessment</TableCell>
                  <TableCell sx={{ fontWeight: "bold" }}>Most Repeated Word</TableCell>
                  <TableCell sx={{ fontWeight: "bold" }}>General Suggestion</TableCell>
                  <TableCell sx={{ fontWeight: "bold" }}>Confident Percentage</TableCell>
                </TableRow>
              </TableHead>
              <TableBody>
                {reports.length === 0 && !reportsLoading ? (
                  <TableRow>
                    <TableCell colSpan={4} align="center">
                      <Typography variant="body1">No reports found.</Typography>
                    </TableCell>
                  </TableRow>
                ) : (
                  reports.map((report) => (
                    <TableRow key={report.id} hover>
                      <TableCell>{report.pronunciation_assessment || "N/A"}</TableCell>
                      <TableCell>{report.most_repeated_word || "N/A"}</TableCell>
                      <TableCell>{report.general_pronunciation_suggestion || "N/A"}</TableCell>
                      <TableCell>
                        {report.confident_percentage
                          ? `${report.confident_percentage}%`
                          : "N/A"}
                      </TableCell>
                    </TableRow>
                  ))
                )}
              </TableBody>
            </Table>
          </TableWrapper>

          {reportsError && (
            <Alert
              severity="error"
              sx={{ mt: 4 }}
              action={
                <Button
                  color="inherit"
                  size="small"
                  onClick={() => {
                    setReportsError("");
                    fetchReports();
                  }}
                >
                  Retry
                </Button>
              }
            >
              {reportsError}
            </Alert>
          )}
        </Container>
      </main>
      <Footer />
    </ThemeProvider>
  );
}

export default UploadAnalysis;