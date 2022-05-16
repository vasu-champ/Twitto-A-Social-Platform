/**
 * This class is generated by jOOQ
 */
package tech.codingclub.helix.tables;

/**
 * This class is generated by jOOQ.
 */
@javax.annotation.Generated(value    = { "http://www.jooq.org", "3.3.2" },
                            comments = "This class is generated by jOOQ")
@java.lang.SuppressWarnings({ "all", "unchecked", "rawtypes" })
public class Music extends org.jooq.impl.TableImpl<tech.codingclub.helix.tables.records.MusicRecord> {

	private static final long serialVersionUID = 1769276565;

	/**
	 * The singleton instance of <code>public.music</code>
	 */
	public static final tech.codingclub.helix.tables.Music MUSIC = new tech.codingclub.helix.tables.Music();

	/**
	 * The class holding records for this type
	 */
	@Override
	public java.lang.Class<tech.codingclub.helix.tables.records.MusicRecord> getRecordType() {
		return tech.codingclub.helix.tables.records.MusicRecord.class;
	}

	/**
	 * The column <code>public.music.singers</code>.
	 */
	public final org.jooq.TableField<tech.codingclub.helix.tables.records.MusicRecord, java.lang.String> SINGERS = createField("singers", org.jooq.impl.SQLDataType.VARCHAR.length(300), this, "");

	/**
	 * The column <code>public.music.parent_link</code>.
	 */
	public final org.jooq.TableField<tech.codingclub.helix.tables.records.MusicRecord, java.lang.String> PARENT_LINK = createField("parent_link", org.jooq.impl.SQLDataType.VARCHAR, this, "");

	/**
	 * The column <code>public.music.album</code>.
	 */
	public final org.jooq.TableField<tech.codingclub.helix.tables.records.MusicRecord, java.lang.String> ALBUM = createField("album", org.jooq.impl.SQLDataType.VARCHAR, this, "");

	/**
	 * The column <code>public.music.lyricist</code>.
	 */
	public final org.jooq.TableField<tech.codingclub.helix.tables.records.MusicRecord, java.lang.String> LYRICIST = createField("lyricist", org.jooq.impl.SQLDataType.VARCHAR, this, "");

	/**
	 * The column <code>public.music.music_director</code>.
	 */
	public final org.jooq.TableField<tech.codingclub.helix.tables.records.MusicRecord, java.lang.String> MUSIC_DIRECTOR = createField("music_director", org.jooq.impl.SQLDataType.VARCHAR.length(100), this, "");

	/**
	 * The column <code>public.music.Duration</code>.
	 */
	public final org.jooq.TableField<tech.codingclub.helix.tables.records.MusicRecord, java.lang.String> DURATION = createField("Duration", org.jooq.impl.SQLDataType.VARCHAR, this, "");

	/**
	 * The column <code>public.music.Child_link</code>.
	 */
	public final org.jooq.TableField<tech.codingclub.helix.tables.records.MusicRecord, java.lang.String> CHILD_LINK = createField("Child_link", org.jooq.impl.SQLDataType.VARCHAR, this, "");

	/**
	 * The column <code>public.music.download_128</code>.
	 */
	public final org.jooq.TableField<tech.codingclub.helix.tables.records.MusicRecord, java.lang.String> DOWNLOAD_128 = createField("download_128", org.jooq.impl.SQLDataType.VARCHAR, this, "");

	/**
	 * The column <code>public.music.download_256</code>.
	 */
	public final org.jooq.TableField<tech.codingclub.helix.tables.records.MusicRecord, java.lang.String> DOWNLOAD_256 = createField("download_256", org.jooq.impl.SQLDataType.VARCHAR, this, "");

	/**
	 * The column <code>public.music.songname</code>.
	 */
	public final org.jooq.TableField<tech.codingclub.helix.tables.records.MusicRecord, java.lang.String> SONGNAME = createField("songname", org.jooq.impl.SQLDataType.VARCHAR, this, "");

	/**
	 * Create a <code>public.music</code> table reference
	 */
	public Music() {
		this("music", null);
	}

	/**
	 * Create an aliased <code>public.music</code> table reference
	 */
	public Music(java.lang.String alias) {
		this(alias, tech.codingclub.helix.tables.Music.MUSIC);
	}

	private Music(java.lang.String alias, org.jooq.Table<tech.codingclub.helix.tables.records.MusicRecord> aliased) {
		this(alias, aliased, null);
	}

	private Music(java.lang.String alias, org.jooq.Table<tech.codingclub.helix.tables.records.MusicRecord> aliased, org.jooq.Field<?>[] parameters) {
		super(alias, tech.codingclub.helix.Public.PUBLIC, aliased, parameters, "");
	}

	/**
	 * {@inheritDoc}
	 */
	@Override
	public tech.codingclub.helix.tables.Music as(java.lang.String alias) {
		return new tech.codingclub.helix.tables.Music(alias, this);
	}

	/**
	 * Rename this table
	 */
	public tech.codingclub.helix.tables.Music rename(java.lang.String name) {
		return new tech.codingclub.helix.tables.Music(name, null);
	}
}