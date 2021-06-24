use std::{
    fs,
    path::Path,
    sync::mpsc::{channel, Receiver, Sender},
    io::{Read, Write},
};
use thiserror::Error;
use serde::Deserialize;

#[derive(Debug, Error)]
enum AddZError {
    #[error("the locus_{0} is not valid")]
    BadLocusNumber(u8),
    #[error("position {0} is out of range for locus_{1}")]
    BadPosition(usize, u8),
}

#[derive(Default)]
struct Counter {
    locus_3: [(u128, u128); 6],
    locus_4: [(u128, u128); 8],
    locus_7: [(u128, u128); 9],
    locus_2: [(u128, u128); 11],
}

impl Counter {
    fn add_big(&mut self, locus: u8, position: usize) -> Result<(), AddZError> {
        match locus {
            3 => {
                if position < 6 {
                    self.locus_3[position].0 += 1;
                    Ok(())
                } else {
                    Err(AddZError::BadPosition(position, locus))
                }
            }
            4 => {
                if position < 8 {
                    self.locus_4[position].0 += 1;
                    Ok(())
                } else {
                    Err(AddZError::BadPosition(position, locus))
                }
            }
            9 => {
                if position < 9 {
                    self.locus_7[position].0 += 1;
                    Ok(())
                } else {
                    Err(AddZError::BadPosition(position, locus))
                }
            }
            11 => {
                if position < 6 {
                    self.locus_3[position].0 += 1;
                    Ok(())
                } else {
                    Err(AddZError::BadPosition(position, locus))
                }
            }
            _ => Err(AddZError::BadLocusNumber(locus)),
        }
    }
    fn add_small(&mut self, locus: u8, position: usize) -> Result<(), AddZError> {
        match locus {
            3 => {
                if position < 6 {
                    self.locus_3[position].1 += 1;
                    Ok(())
                } else {
                    Err(AddZError::BadPosition(position, locus))
                }
            }
            4 => {
                if position < 8 {
                    self.locus_4[position].1 += 1;
                    Ok(())
                } else {
                    Err(AddZError::BadPosition(position, locus))
                }
            }
            9 => {
                if position < 9 {
                    self.locus_7[position].1 += 1;
                    Ok(())
                } else {
                    Err(AddZError::BadPosition(position, locus))
                }
            }
            11 => {
                if position < 6 {
                    self.locus_3[position].1 += 1;
                    Ok(())
                } else {
                    Err(AddZError::BadPosition(position, locus))
                }
            }
            _ => Err(AddZError::BadLocusNumber(locus)),
        }
    }
}

impl std::ops::AddAssign for Counter {
    fn add_assign(&mut self, other: Self) {
        for i in 0..6 {
            self.locus_3[i].0 += other.locus_3[i].0;
            self.locus_3[i].1 += other.locus_3[i].1;
        }
        for i in 0..8 {
            self.locus_4[i].0 += other.locus_4[i].0;
            self.locus_4[i].1 += other.locus_4[i].1;
        }
        for i in 0..9 {
            self.locus_7[i].0 += other.locus_7[i].0;
            self.locus_7[i].1 += other.locus_7[i].1;
        }
        for i in 0..11 {
            self.locus_2[i].0 += other.locus_2[i].0;
            self.locus_2[i].1 += other.locus_2[i].1;
        }
    }
}

#[derive(Debug, Error)]
enum ThingError {
    #[error(transparent)]
    IoError(#[from] std::io::Error),
    #[error(transparent)]
    CsvError(#[from] csv::Error)
}

#[derive(Debug, Deserialize)]
struct Record {
    sample: String,
    locus: String,
    UMI: String,
    #[serde(rename(deserialize = "consensusZstring_0.9"))]
    consensusZstring: String,
    methCGs: u8,
    totalCGs: u8,
    methRatio: f64,
    numReads: u32,
    GCcontent: f64,
}

fn do_thing(file: &Path) -> Result<(), ThingError> {
    let meta = fs::metadata(file)?;
    let file_size = meta.len();
    let csv_file = std::fs::OpenOptions::new().read(true).open(file)?;
    let buf = std::io::BufReader::new(csv_file);
    let mut reader = csv::Reader::from_reader(buf);
    for rd in reader.deserialize() {
        let record : Record = rd?;
        for i in 0..record.consensusZstring.len() {
            // check which locus it is
                // count the z's
        }
    }
    Ok(())
}

fn main() {
    let csv = fs::read_dir("./");
}
