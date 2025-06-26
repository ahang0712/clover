; ModuleID = 'svp_simple_028_001.bc'
source_filename = "./svp_simple_028_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_028_001_gloable_var = common global i32 0, align 4
@svp_simple_028_001_isr_1_flag = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @svp_simple_028_001_main() #0 !dbg !7 {
  call void @svp_simple_028_001_init(), !dbg !10
  call void @disable_isr(i32 -1), !dbg !11
  call void @enable_isr(i32 1), !dbg !12
  %1 = load volatile i32, i32* @svp_simple_028_001_gloable_var, align 4, !dbg !13, !tbaa !14
  %2 = icmp sgt i32 %1, 12, !dbg !18
  br i1 %2, label %3, label %4, !dbg !13

3:                                                ; preds = %0
  store volatile i32 0, i32* @svp_simple_028_001_gloable_var, align 4, !dbg !19, !tbaa !14
  br label %4, !dbg !20

4:                                                ; preds = %3, %0
  ret i32 0, !dbg !21
}

declare void @disable_isr(i32) #1

declare void @enable_isr(i32) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_028_001_init() #0 !dbg !22 {
  %1 = call i32 (...) @rand(), !dbg !23
  store volatile i32 %1, i32* @svp_simple_028_001_gloable_var, align 4, !dbg !24, !tbaa !14
  %2 = call i32 (...) @rand(), !dbg !25
  store volatile i32 %2, i32* @svp_simple_028_001_isr_1_flag, align 4, !dbg !26, !tbaa !14
  call void (...) @init(), !dbg !27
  ret void, !dbg !28
}

declare i32 @rand(...) #1

declare void @init(...) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_028_001_isr_1() #0 !dbg !29 {
  store volatile i32 12, i32* @svp_simple_028_001_gloable_var, align 4, !dbg !30, !tbaa !14
  store volatile i32 0, i32* @svp_simple_028_001_isr_1_flag, align 4, !dbg !31, !tbaa !14
  call void @enable_isr(i32 2), !dbg !32
  ret void, !dbg !33
}

; Function Attrs: nounwind uwtable
define void @svp_simple_028_001_isr_2() #0 !dbg !34 {
  %1 = load volatile i32, i32* @svp_simple_028_001_isr_1_flag, align 4, !dbg !35, !tbaa !14
  %2 = icmp ne i32 %1, 0, !dbg !35
  br i1 %2, label %3, label %6, !dbg !35

3:                                                ; preds = %0
  %4 = load volatile i32, i32* @svp_simple_028_001_gloable_var, align 4, !dbg !36, !tbaa !14
  %5 = add nsw i32 %4, 2, !dbg !36
  store volatile i32 %5, i32* @svp_simple_028_001_gloable_var, align 4, !dbg !36, !tbaa !14
  br label %6, !dbg !37

6:                                                ; preds = %3, %0
  ret void, !dbg !38
}

; Function Attrs: nounwind uwtable
define void @svp_simple_028_001_isr_3() #0 !dbg !39 {
  %1 = load volatile i32, i32* @svp_simple_028_001_gloable_var, align 4, !dbg !40, !tbaa !14
  %2 = add nsw i32 %1, 3, !dbg !40
  store volatile i32 %2, i32* @svp_simple_028_001_gloable_var, align 4, !dbg !40, !tbaa !14
  ret void, !dbg !41
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_028_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_028")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_028_001_main", scope: !8, file: !8, line: 24, type: !9, scopeLine: 24, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_028_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_028")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 25, column: 3, scope: !7)
!11 = !DILocation(line: 27, column: 3, scope: !7)
!12 = !DILocation(line: 28, column: 3, scope: !7)
!13 = !DILocation(line: 29, column: 7, scope: !7)
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !16, i64 0}
!16 = !{!"omnipotent char", !17, i64 0}
!17 = !{!"Simple C/C++ TBAA"}
!18 = !DILocation(line: 29, column: 38, scope: !7)
!19 = !DILocation(line: 30, column: 36, scope: !7)
!20 = !DILocation(line: 31, column: 3, scope: !7)
!21 = !DILocation(line: 32, column: 3, scope: !7)
!22 = distinct !DISubprogram(name: "svp_simple_028_001_init", scope: !8, file: !8, line: 35, type: !9, scopeLine: 35, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!23 = !DILocation(line: 36, column: 36, scope: !22)
!24 = !DILocation(line: 36, column: 34, scope: !22)
!25 = !DILocation(line: 37, column: 35, scope: !22)
!26 = !DILocation(line: 37, column: 33, scope: !22)
!27 = !DILocation(line: 39, column: 3, scope: !22)
!28 = !DILocation(line: 40, column: 1, scope: !22)
!29 = distinct !DISubprogram(name: "svp_simple_028_001_isr_1", scope: !8, file: !8, line: 42, type: !9, scopeLine: 42, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!30 = !DILocation(line: 43, column: 34, scope: !29)
!31 = !DILocation(line: 44, column: 33, scope: !29)
!32 = !DILocation(line: 45, column: 3, scope: !29)
!33 = !DILocation(line: 46, column: 1, scope: !29)
!34 = distinct !DISubprogram(name: "svp_simple_028_001_isr_2", scope: !8, file: !8, line: 47, type: !9, scopeLine: 47, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!35 = !DILocation(line: 48, column: 7, scope: !34)
!36 = !DILocation(line: 49, column: 36, scope: !34)
!37 = !DILocation(line: 50, column: 3, scope: !34)
!38 = !DILocation(line: 51, column: 1, scope: !34)
!39 = distinct !DISubprogram(name: "svp_simple_028_001_isr_3", scope: !8, file: !8, line: 52, type: !9, scopeLine: 52, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!40 = !DILocation(line: 53, column: 34, scope: !39)
!41 = !DILocation(line: 54, column: 1, scope: !39)
