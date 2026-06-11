<?xml version="1.0" encoding="UTF-8"?>
<map version="1.0.1">
  <node TEXT="2026-03 奢品大秀话题 社交热度↑（相对2025-03）" ID="root" COLOR="#FF0000">
    <node TEXT="Heat 定义（建议）: H = α*Impressions + β*Engagements + γ*Views + η*Sentiment" COLOR="#0000FF" ID="def">
      <node TEXT="Engagements = likes + comments + forwards（可加权）" COLOR="#808080" ID="def1"/>
      <node TEXT="Sentiment 归一化至 [-1,1] 或 [0,1]" COLOR="#808080" ID="def2"/>
      <node TEXT="权重 α,β,γ,η 可通过回归/PCA 训练确定" COLOR="#808080" ID="def3"/>
    </node>

    <!-- A. 内容维度 -->
    <node TEXT="A. 内容维度 (Content)" COLOR="#0000FF" ID="A">
      <node TEXT="A1. 帖子量级" COLOR="#00AA00" ID="A1">
        <node TEXT="原创帖数 = count(posts WHERE type='original' AND topic)" COLOR="#808080" ID="A1.1"/>
        <node TEXT="转发/评论/跟帖数 = count(...)" COLOR="#808080" ID="A1.2"/>
        <node TEXT="YoY增长率 = (N2026 - N2025) / N2025" COLOR="#808080" ID="A1.3"/>
      </node>
      <node TEXT="A2. 内容形式与质量" COLOR="#00AA00" ID="A2">
        <node TEXT="多媒体比率 = posts_with_image_or_video / total_posts" COLOR="#808080" ID="A2.1"/>
        <node TEXT="视频完播率 = completions / plays" COLOR="#808080" ID="A2.2"/>
        <node TEXT="Live 数量 & 平均观看时长" COLOR="#808080" ID="A2.3"/>
      </node>
      <node TEXT="A3. 话题细分与集中度" COLOR="#00AA00" ID="A3">
        <node TEXT="子话题占比 share_i = posts_in_subtopic_i / total_posts" COLOR="#808080" ID="A3.1"/>
        <node TEXT="HHI = Σ share_i^2（越大越集中）" COLOR="#808080" ID="A3.2"/>
      </node>
      <node TEXT="A4. 内容互动度（单帖强度）" COLOR="#00AA00" ID="A4">
        <node TEXT="avg_engagements_per_post = total_engagements / total_posts" COLOR="#808080" ID="A4.1"/>
        <node TEXT="median, p95 用于衡量长尾" COLOR="#808080" ID="A4.2"/>
      </node>
      <node TEXT="A5. 情感/主题倾向" COLOR="#00AA00" ID="A5">
        <node TEXT="avg_sentiment = mean(sentiment_score_of_posts)" COLOR="#808080" ID="A5.1"/>
        <node TEXT="正向比例 = count(posts sentiment>threshold)/total_posts" COLOR="#808080" ID="A5.2"/>
        <node TEXT="主题标签热度 top-N 标签 PV/帖子数" COLOR="#808080" ID="A5.3"/>
      </node>
    </node>

    <!-- B. 用户维度 -->
    <node TEXT="B. 用户维度 (Users)" COLOR="#0000FF" ID="B">
      <node TEXT="B1. 发帖/互动用户规模" COLOR="#00AA00" ID="B1">
        <node TEXT="active_posters = distinct users posting on topic" COLOR="#808080" ID="B1.1"/>
        <node TEXT="active_engagers = distinct users liking/commenting/forwarding" COLOR="#808080" ID="B1.2"/>
        <node TEXT="YoY 增速 = (U2026 - U2025)/U2025" COLOR="#808080" ID="B1.3"/>
      </node>
      <node TEXT="B2. 新增用户 vs 老用户贡献" COLOR="#00AA00" ID="B2">
        <node TEXT="new_users_share = posts_by_new_users / total_posts" COLOR="#808080" ID="B2.1"/>
        <node TEXT="returning_users_share = posts_by_returning / total_posts" COLOR="#808080" ID="B2.2"/>
      </node>
      <node TEXT="B3. KOL / 名人 / 品牌账号影响力" COLOR="#00AA00" ID="B3">
        <node TEXT="topK_authors_share = engagements_from_topK / total_engagements" COLOR="#808080" ID="B3.1"/>
        <node TEXT="KOL_post_count & avg_engagement_per_KOL_post" COLOR="#808080" ID="B3.2"/>
      </node>
      <node TEXT="B4. 粉丝加权曝光" COLOR="#00AA00" ID="B4">
        <node TEXT="follower_weighted_reach ≈ Σ followers(poster_i)（需去重/估算重叠）" COLOR="#808080" ID="B4.1"/>
      </node>
      <node TEXT="B5. 用户属性分布（地域/年龄/性别）" COLOR="#00AA00" ID="B5">
        <node TEXT="各省市占比、增长率（是否吸引新地域）" COLOR="#808080" ID="B5.1"/>
        <node TEXT="年龄/性别分布变化（年轻占比是否上升）" COLOR="#808080" ID="B5.2"/>
      </node>
    </node>

    <!-- C. 传播维度 -->
    <node TEXT="C. 传播维度 (Propagation)" COLOR="#0000FF" ID="C">
      <node TEXT="C1. 曝光与覆盖 (Reach / Impressions)" COLOR="#00AA00" ID="C1">
        <node TEXT="platform_impressions = SUM(impression_logs filtered by topic)" COLOR="#808080" ID="C1.1"/>
        <node TEXT="unique_reach = distinct users who saw topic posts" COLOR="#808080" ID="C1.2"/>
      </node>
      <node TEXT="C2. 病毒性 / 传播效率" COLOR="#00AA00" ID="C2">
        <node TEXT="repost_rate = total_reposts / total_original_posts" COLOR="#808080" ID="C2.1"/>
        <node TEXT="viral_coeff = avg_reposts_generated_per_post" COLOR="#808080" ID="C2.2"/>
        <node TEXT="cascade_depth 分布：mean/median/max" COLOR="#808080" ID="C2.3"/>
      </node>
      <node TEXT="C3. 传播速度与持久度" COLOR="#00AA00" ID="C3">
        <node TEXT="time_to_peak = time(first_post -> daily_peak)" COLOR="#808080" ID="C3.1"/>
        <node TEXT="half_life = time to fall to 50% of peak" COLOR="#808080" ID="C3.2"/>
      </node>
      <node TEXT="C4. 话题页/榜单可见性" COLOR="#00AA00" ID="C4">
        <node TEXT="trending_list_entry_count & duration（上榜次数与时长）" COLOR="#808080" ID="C4.1"/>
        <node TEXT="话题页PV（topic page views）" COLOR="#808080" ID="C4.2"/>
      </node>
    </node>

    <!-- D. 时间维度 -->
    <node TEXT="D. 时间维度 (Time)" COLOR="#0000FF" ID="D">
      <node TEXT="D1. 日/小时级时序曲线" COLOR="#00AA00" ID="D1">
        <node TEXT="hourly_pv_series, hourly_engagement_series" COLOR="#808080" ID="D1.1"/>
      </node>
      <node TEXT="D2. 活动窗口对比" COLOR="#00AA00" ID="D2">
        <node TEXT="show_day vs pre/post 7/14/30 天 baseline" COLOR="#808080" ID="D2.1"/>
        <node TEXT="peak_ratio = peak_value / baseline_mean" COLOR="#808080" ID="D2.2"/>
      </node>
      <node TEXT="D3. YoY 时间结构差异" COLOR="#00AA00" ID="D3">
        <node TEXT="day-by-day Δ（单天冲顶 vs 长尾）" COLOR="#808080" ID="D3.1"/>
      </node>
    </node>

    <!-- E. 平台/运营 & 商业因素 -->
    <node TEXT="E. 平台/运营 & 商业因素 (Platform / Paid / Official)" COLOR="#0000FF" ID="E">
      <node TEXT="E1. 官方与品牌行为" COLOR="#00AA00" ID="E1">
        <node TEXT="品牌官博发文数、互动数、直播/带货行为" COLOR="#808080" ID="E1.1"/>
      </node>
      <node TEXT="E2. 平台推广 / 广告投放" COLOR="#00AA00" ID="E2">
        <node TEXT="paid_impressions, ad_spend_on_topic（如可得）" COLOR="#808080" ID="E2.1"/>
        <node TEXT="boost_count = 被置顶/推广的贴数" COLOR="#808080" ID="E2.2"/>
      </node>
      <node TEXT="E3. 平台功能/规则变化" COLOR="#00AA00" ID="E3">
        <node TEXT="推荐算法改动、话题榜规则改动（需核实）" COLOR="#808080" ID="E3.1"/>
      </node>
    </node>

    <!-- F. 外部媒介/多平台联动 -->
    <node TEXT="F. 外部媒介 / 多平台联动 (External)" COLOR="#0000FF" ID="F">
      <node TEXT="F1. 主流媒体与 KOL 渗透" COLOR="#00AA00" ID="F1">
        <node TEXT="媒体报道数（news_count）与 referral 流量" COLOR="#808080" ID="F1.1"/>
      </node>
      <node TEXT="F2. 跨平台传播（抖音/小红书/微信）" COLOR="#00AA00" ID="F2">
        <node TEXT="cross_post_rate = posts_with_external_link / total_posts" COLOR="#808080" ID="F2.1"/>
      </node>
      <node TEXT="F3. 国际事件/品牌日程" COLOR="#00AA00" ID="F3">
        <node TEXT="show_dates 对齐（活动日与热度峰值对齐）" COLOR="#808080" ID="F3.1"/>
      </node>
    </node>

    <!-- G. 测量规范与归一 -->
    <node TEXT="G. 测量规范 & 归一 (Normalization & Robustness)" COLOR="#0000FF" ID="G">
      <node TEXT="G1. 平台基线控制" COLOR="#00AA00" ID="G1">
        <node TEXT="Heat_per_1M_MAU = H / (MAU/1e6)（控制平台规模变化）" COLOR="#808080" ID="G1.1"/>
      </node>
      <node TEXT="G2. 去噪（bot / spam / duplicates）" COLOR="#00AA00" ID="G2">
        <node TEXT="automated_post_ratio = posts_by_suspected_bots / total_posts" COLOR="#808080" ID="G2.1"/>
      </node>
      <node TEXT="G3. 置信区间与显著性" COLOR="#00AA00" ID="G3">
        <node TEXT="Bootstrap CI for mean_engagements; p-value for YoY diff" COLOR="#808080" ID="G3.1"/>
      </node>
      <node TEXT="G4. 数据源与字段说明" COLOR="#00AA00" ID="G4">
        <node TEXT="impressions_log, posts_table, users, ads, topic_page_PV, referrals" COLOR="#808080" ID="G4.1"/>
      </node>
    </node>

    <!-- 归因方法 -->
    <node TEXT="归因方法 & 分解流程" COLOR="#0000FF" ID="method">
      <node TEXT="1) 定义 H 并用回归拟合权重" COLOR="#808080" ID="m1"/>
      <node TEXT="2) 对数分解: Δlog(H) ≈ Δlog(Impr) + Δlog(ER) + Δlog(Sent)" COLOR="#808080" ID="m2"/>
      <node TEXT="3) Impressions 进一步拆分：posting_volume + follower_reach + paid + platform_recommend" COLOR="#808080" ID="m3"/>
      <node TEXT="4) 用夏普利或回归分配交互项贡献（KOL 与 paid 等）" COLOR="#808080" ID="m4"/>
      <node TEXT="5) 事件研究：基于 show_date 计算累计异常热度（AAR/CAR）" COLOR="#808080" ID="m5"/>
      <node TEXT="6) 输出每项贡献及 Bootstrap CI" COLOR="#808080" ID="m6"/>
    </node>

    <!-- 操作建议 -->
    <node TEXT="执行建议（优先级）" COLOR="#0000FF" ID="next">
      <node TEXT="1) 确认 H 的度量与权重" COLOR="#808080" ID="n1"/>
      <node TEXT="2) 拉取数据表并计算所有基础指标（日/小时/账号粒度）" COLOR="#808080" ID="n2"/>
      <node TEXT="3) 进行 YoY 分解 & 回归 & 夏普利归因" COLOR="#808080" ID="n3"/>
      <node TEXT="4) 可视化仪表盘：总体 Heat 与因子贡献堆叠图、KOL 列表、时间序列" COLOR="#808080" ID="n4"/>
    </node>

  </node>
</map>
