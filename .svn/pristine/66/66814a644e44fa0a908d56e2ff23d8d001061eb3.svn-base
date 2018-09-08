package com.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * MSongs entity. @author MyEclipse Persistence Tools
 */

public class MSongs implements java.io.Serializable {

	// Fields

	private Integer id;
	private MLevel MLevel;
	private String name;
	private String filename;
	private Integer status;
	private Set MGuesses = new HashSet(0);

	// Constructors

	/** default constructor */
	public MSongs() {
	}

	/** full constructor */
	public MSongs(MLevel MLevel, String name, String filename, Integer status,
			Set MGuesses) {
		this.MLevel = MLevel;
		this.name = name;
		this.filename = filename;
		this.status = status;
		this.MGuesses = MGuesses;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public MLevel getMLevel() {
		return this.MLevel;
	}

	public void setMLevel(MLevel MLevel) {
		this.MLevel = MLevel;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFilename() {
		return this.filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Set getMGuesses() {
		return this.MGuesses;
	}

	public void setMGuesses(Set MGuesses) {
		this.MGuesses = MGuesses;
	}

}