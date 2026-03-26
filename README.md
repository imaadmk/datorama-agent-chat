# Datorama Agent Chat Widget - Deployment Ready

This is your production-ready Agentforce chat widget for embedding in Datorama.

---

## 🚀 Quick Deploy to GitHub Pages (Free HTTPS Hosting)

### Step 1: Create GitHub Repository

1. Go to https://github.com/new
2. Repository name: `datorama-agent-chat`
3. Public repository
4. **Do NOT** initialize with README
5. Click **Create repository**

### Step 2: Deploy (Run from Terminal)

```bash
cd "/Users/imaad.khan/MCI Agent/datorama-chat-widget"

# Initialize git
git init
git add .
git commit -m "Deploy Datorama agent chat widget"

# Connect to your GitHub repo (REPLACE with your username)
git remote add origin https://github.com/YOUR-USERNAME/datorama-agent-chat.git

# Push
git branch -M main
git push -u origin main
```

### Step 3: Enable GitHub Pages

1. Go to your repo: `https://github.com/YOUR-USERNAME/datorama-agent-chat`
2. Click **Settings** → **Pages**
3. Source: **main branch**
4. Click **Save**
5. Wait 2-3 minutes for deployment

### Step 4: Get Your URL

Your chat widget will be live at:
```
https://YOUR-USERNAME.github.io/datorama-agent-chat/
```

---

## 📦 Embed in Datorama Dashboard

Once deployed to GitHub Pages, add this in Datorama:

### Option 1: iFrame Widget

If Datorama supports iframe widgets:

```html
<iframe
    src="https://YOUR-USERNAME.github.io/datorama-agent-chat/"
    width="100%"
    height="700px"
    frameborder="0"
    allow="microphone; camera"
    style="border-radius: 12px; box-shadow: 0 2px 10px rgba(0,0,0,0.1);">
</iframe>
```

### Option 2: Direct Embed Code

If Datorama allows custom HTML:

Copy the entire contents of `index.html` and paste in a Datorama custom widget.

---

## ✅ Testing Before Datorama

1. **Test locally** (will have CORS issues):
   ```bash
   python3 -m http.server 8000
   # Open: http://localhost:8000
   ```

2. **Test on Salesforce directly** (no CORS):
   ```
   https://storm-ba3e1e6618d0c6.my.site.com/ESWDatoramaWebChat1774479171702
   ```

3. **Test on GitHub Pages** (production):
   ```
   https://YOUR-USERNAME.github.io/datorama-agent-chat/
   ```

---

## 🎨 Customization

Edit `index.html` to change:

### Colors
```css
background: linear-gradient(135deg, #1e3a5f 0%, #6366f1 100%);
/* Change to your brand colors */
```

### Header Text
```html
<h2>Insights Powered by Agentforce</h2>
<p>Ask me anything about your marketing performance</p>
```

### Status Badge
```html
<div class="status-badge">
    Online - Ready to help
</div>
```

---

## 🔧 Configuration

The widget is already configured with your Salesforce instance:
- Org ID: `00DWs00000Kxsld`
- Channel: `Datorama_Web_Chat`
- Site: `ESWDatoramaWebChat1774479171702`

No additional configuration needed!

---

## 📱 Features

✅ Responsive design (works on mobile/tablet)
✅ Beautiful gradient header
✅ Live status indicator
✅ Loading state while chat initializes
✅ Error handling
✅ HTTPS ready for production
✅ No external dependencies (except Salesforce)

---

## 🐛 Troubleshooting

### Chat doesn't appear
1. Check browser console (F12) for errors
2. Verify agent is **Active** in Salesforce
3. Check CORS settings allow your domain
4. Try opening the Salesforce site URL directly to test

### "Access-Control-Allow-Origin" error
- Deploy to HTTPS (GitHub Pages, not localhost)
- Add your domain to Salesforce CORS settings

### Agent doesn't respond
1. Test agent in Salesforce Agent Builder first
2. Verify Apex permissions for Einstein Service Agent profile
3. Check topic configuration in Agent Builder

---

## 📞 Support

- Salesforce Embedded Service: https://developer.salesforce.com/docs/atlas.en-us.service_sdk_ios.meta/service_sdk_ios/
- Agent Builder: Setup → Agent Builder
- Test agent: Click "Test" in Agent Builder

---

**Your agent is ready to answer questions about:**
- Impressions, clicks, conversions
- Campaign performance
- Time period comparisons
- Channel analysis
- And more from workspace 193286!
