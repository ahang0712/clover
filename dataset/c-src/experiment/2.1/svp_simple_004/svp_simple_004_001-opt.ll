; ModuleID = 'svp_simple_004_001-opt.bc'
source_filename = "./svp_simple_004_001.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@svp_simple_004_001_condition1 = global i32 1, align 4
@svp_simple_004_001_condition2 = global i32 1, align 4
@svp_simple_004_001_condition3 = global i32 1, align 4
@svp_simple_004_001_condition4 = global i32 1, align 4
@svp_simple_004_001_condition5 = global i32 1, align 4
@svp_simple_004_001_condition6 = global i32 1, align 4
@svp_simple_004_001_global_var1 = global i32 17, align 4
@svp_simple_004_001_global_var2 = global i32 34, align 4
@svp_simple_004_001_global_var3 = global i32 51, align 4

; Function Attrs: nounwind uwtable
define void @svp_simple_004_001_main() #0 !dbg !7 {
  call void (...) @init(), !dbg !10
  call void @disable_isr(i32 2), !dbg !11
  %1 = load volatile i32, i32* @svp_simple_004_001_condition1, align 4, !dbg !12, !tbaa !13
  %2 = icmp eq i32 %1, 1, !dbg !17
  br i1 %2, label %3, label %6, !dbg !12

3:                                                ; preds = %0
  %4 = load volatile i32, i32* @svp_simple_004_001_global_var1, align 4, !dbg !18, !tbaa !13
  %5 = load volatile i32, i32* @svp_simple_004_001_global_var3, align 4, !dbg !19, !tbaa !13
  br label %6, !dbg !20

6:                                                ; preds = %3, %0
  %7 = load volatile i32, i32* @svp_simple_004_001_condition2, align 4, !dbg !21, !tbaa !13
  %8 = icmp eq i32 %7, 1, !dbg !22
  br i1 %8, label %9, label %12, !dbg !21

9:                                                ; preds = %6
  %10 = load volatile i32, i32* @svp_simple_004_001_global_var1, align 4, !dbg !23, !tbaa !13
  %11 = load volatile i32, i32* @svp_simple_004_001_global_var3, align 4, !dbg !24, !tbaa !13
  br label %12, !dbg !25

12:                                               ; preds = %9, %6
  %13 = load volatile i32, i32* @svp_simple_004_001_condition4, align 4, !dbg !26, !tbaa !13
  %14 = icmp eq i32 %13, 1, !dbg !27
  br i1 %14, label %15, label %17, !dbg !26

15:                                               ; preds = %12
  %16 = load volatile i32, i32* @svp_simple_004_001_global_var2, align 4, !dbg !28, !tbaa !13
  br label %17, !dbg !29

17:                                               ; preds = %15, %12
  %18 = load volatile i32, i32* @svp_simple_004_001_condition5, align 4, !dbg !30, !tbaa !13
  %19 = icmp eq i32 %18, 1, !dbg !31
  br i1 %19, label %20, label %22, !dbg !30

20:                                               ; preds = %17
  %21 = load volatile i32, i32* @svp_simple_004_001_global_var2, align 4, !dbg !32, !tbaa !13
  br label %22, !dbg !33

22:                                               ; preds = %20, %17
  ret void, !dbg !34
}

declare void @init(...) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

declare void @disable_isr(i32) #1

; Function Attrs: argmemonly nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define void @svp_simple_004_001_isr_1() #0 !dbg !35 {
  store volatile i32 0, i32* @svp_simple_004_001_condition6, align 4, !dbg !36, !tbaa !13
  %1 = load volatile i32, i32* @svp_simple_004_001_condition3, align 4, !dbg !37, !tbaa !13
  %2 = icmp eq i32 %1, 1, !dbg !38
  br i1 %2, label %3, label %4, !dbg !37

3:                                                ; preds = %0
  store volatile i32 170, i32* @svp_simple_004_001_global_var1, align 4, !dbg !39, !tbaa !13
  br label %5, !dbg !40

4:                                                ; preds = %0
  store volatile i32 204, i32* @svp_simple_004_001_global_var3, align 4, !dbg !41, !tbaa !13
  br label %5

5:                                                ; preds = %4, %3
  call void @enable_isr(i32 2), !dbg !42
  ret void, !dbg !43
}

declare void @enable_isr(i32) #1

; Function Attrs: nounwind uwtable
define void @svp_simple_004_001_isr_2() #0 !dbg !44 {
  %1 = load volatile i32, i32* @svp_simple_004_001_condition6, align 4, !dbg !45, !tbaa !13
  %2 = icmp eq i32 %1, 1, !dbg !46
  br i1 %2, label %3, label %4, !dbg !45

3:                                                ; preds = %0
  store volatile i32 34, i32* @svp_simple_004_001_global_var2, align 4, !dbg !47, !tbaa !13
  br label %4, !dbg !48

4:                                                ; preds = %3, %0
  ret void, !dbg !49
}

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)", isOptimized: true, runtimeVersion: 0, emissionKind: LineTablesOnly, enums: !2)
!1 = !DIFile(filename: "svp_simple_004_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_004")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 6.0.0-1ubuntu2 (tags/RELEASE_600/final)"}
!7 = distinct !DISubprogram(name: "svp_simple_004_001_main", scope: !8, file: !8, line: 33, type: !9, scopeLine: 33, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!8 = !DIFile(filename: "./svp_simple_004_001.c", directory: "/home/vip/hanghe/race-master/llvm-api-demo/c-src/experiment/2.1/svp_simple_004")
!9 = !DISubroutineType(types: !2)
!10 = !DILocation(line: 34, column: 3, scope: !7)
!11 = !DILocation(line: 38, column: 3, scope: !7)
!12 = !DILocation(line: 40, column: 7, scope: !7)
!13 = !{!14, !14, i64 0}
!14 = !{!"int", !15, i64 0}
!15 = !{!"omnipotent char", !16, i64 0}
!16 = !{!"Simple C/C++ TBAA"}
!17 = !DILocation(line: 40, column: 37, scope: !7)
!18 = !DILocation(line: 41, column: 15, scope: !7)
!19 = !DILocation(line: 42, column: 15, scope: !7)
!20 = !DILocation(line: 43, column: 3, scope: !7)
!21 = !DILocation(line: 45, column: 7, scope: !7)
!22 = !DILocation(line: 45, column: 37, scope: !7)
!23 = !DILocation(line: 46, column: 15, scope: !7)
!24 = !DILocation(line: 47, column: 15, scope: !7)
!25 = !DILocation(line: 48, column: 3, scope: !7)
!26 = !DILocation(line: 50, column: 7, scope: !7)
!27 = !DILocation(line: 50, column: 37, scope: !7)
!28 = !DILocation(line: 50, column: 53, scope: !7)
!29 = !DILocation(line: 50, column: 43, scope: !7)
!30 = !DILocation(line: 52, column: 7, scope: !7)
!31 = !DILocation(line: 52, column: 37, scope: !7)
!32 = !DILocation(line: 52, column: 53, scope: !7)
!33 = !DILocation(line: 52, column: 43, scope: !7)
!34 = !DILocation(line: 53, column: 1, scope: !7)
!35 = distinct !DISubprogram(name: "svp_simple_004_001_isr_1", scope: !8, file: !8, line: 55, type: !9, scopeLine: 55, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!36 = !DILocation(line: 56, column: 33, scope: !35)
!37 = !DILocation(line: 58, column: 7, scope: !35)
!38 = !DILocation(line: 58, column: 37, scope: !35)
!39 = !DILocation(line: 59, column: 36, scope: !35)
!40 = !DILocation(line: 59, column: 5, scope: !35)
!41 = !DILocation(line: 61, column: 36, scope: !35)
!42 = !DILocation(line: 63, column: 3, scope: !35)
!43 = !DILocation(line: 64, column: 1, scope: !35)
!44 = distinct !DISubprogram(name: "svp_simple_004_001_isr_2", scope: !8, file: !8, line: 66, type: !9, scopeLine: 66, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !2)
!45 = !DILocation(line: 67, column: 7, scope: !44)
!46 = !DILocation(line: 67, column: 37, scope: !44)
!47 = !DILocation(line: 68, column: 36, scope: !44)
!48 = !DILocation(line: 68, column: 5, scope: !44)
!49 = !DILocation(line: 69, column: 1, scope: !44)
