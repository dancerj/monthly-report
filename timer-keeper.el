; timer routine waiting for 5 minutes.
(let* ((trem (* 60 5) )) 
  (switch-to-buffer "*timer*")
  (set-default-font "-b&h-lucidatypewriter-bold-r-normal-sans-*-240-*-*-*-*-iso8859-1")
  (while (> trem 0)
    (progn
      (beginning-of-buffer)
      (delete-region (point-min) (point-max))
      (insert (format "%i:%.2i" (/ trem 60) (% trem 60)))
      (setq trem (- trem 1))
      (sit-for 1))))
